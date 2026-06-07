// dashboard_widgets.dart
import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/dashboard/dashboard_state.dart';

// ─── Tarjeta de métrica ───────────────────────────────────────────────────────

class MetricCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final String? subtitulo;
  final IconData icono;
  final Color color;

  const MetricCard({
    super.key,
    required this.titulo,
    required this.valor,
    this.subtitulo,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icono, size: 18, color: color),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              valor,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (subtitulo != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitulo!,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Grid de métricas principales ────────────────────────────────────────────

class MetricsGrid extends StatelessWidget {
  final DashboardData data;

  const MetricsGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      _MetricConfig(
        titulo: "Ventas totales",
        valor: "\$${_formatMoney(data.ventasTotales)}",
        subtitulo: "Hoy: \$${_formatMoney(data.ventasHoy)}",
        icono: Icons.attach_money,
        color: Colors.green,
      ),
      _MetricConfig(
        titulo: "Pedidos",
        valor: "${data.totalPedidos}",
        subtitulo: "${data.pedidosPendientes} pendientes",
        icono: Icons.receipt_long,
        color: Colors.blue,
      ),
      _MetricConfig(
        titulo: "Productos",
        valor: "${data.totalProductos}",
        subtitulo: "${data.productosStockBajo} con stock bajo",
        icono: Icons.inventory_2,
        color: Colors.orange,
      ),
      _MetricConfig(
        titulo: "Clientes",
        valor: "${data.totalClientes}",
        subtitulo: "${data.clientesNuevos} nuevos este mes",
        icono: Icons.people,
        color: Colors.purple,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: metrics.length,
      itemBuilder: (_, i) => MetricCard(
        titulo: metrics[i].titulo,
        valor: metrics[i].valor,
        subtitulo: metrics[i].subtitulo,
        icono: metrics[i].icono,
        color: metrics[i].color,
      ),
    );
  }

  String _formatMoney(double v) {
    if (v >= 1000000) return "${(v / 1000000).toStringAsFixed(1)}M";
    if (v >= 1000) return "${(v / 1000).toStringAsFixed(1)}k";
    return v.toStringAsFixed(0);
  }
}

class _MetricConfig {
  final String titulo, valor;
  final String? subtitulo;
  final IconData icono;
  final Color color;

  _MetricConfig({
    required this.titulo,
    required this.valor,
    this.subtitulo,
    required this.icono,
    required this.color,
  });
}

// ─── Lista de pedidos recientes ───────────────────────────────────────────────

class PedidosRecientesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> pedidos;

  const PedidosRecientesWidget({super.key, required this.pedidos});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pedidos recientes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (pedidos.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text("Sin pedidos recientes", style: TextStyle(color: Colors.grey)),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pedidos.length > 5 ? 5 : pedidos.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final p = pedidos[i];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.receipt, color: Colors.blue, size: 16),
                    ),
                    title: Text(
                      p["cliente"] ?? "Cliente",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      p["fecha"] ?? "",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${p["total"] ?? 0}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        _EstadoBadge(estado: p["estado"] ?? "pendiente"),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _EstadoBadge extends StatelessWidget {
  final String estado;

  const _EstadoBadge({required this.estado});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (estado.toLowerCase()) {
      case "completado":
        color = Colors.green;
        break;
      case "pendiente":
        color = Colors.orange;
        break;
      case "cancelado":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        estado,
        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// ─── Stock crítico ────────────────────────────────────────────────────────────

class StockCriticoWidget extends StatelessWidget {
  final List<Map<String, dynamic>> productos;

  const StockCriticoWidget({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Row(
              children: [
                const Icon(Icons.warning_amber, color: Colors.orange, size: 18),
                const SizedBox(width: 8),
                const Text(
                  "Stock crítico",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${productos.length} productos",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (productos.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text("Todo el inventario está bien ✓", style: TextStyle(color: Colors.grey)),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productos.length > 5 ? 5 : productos.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final p = productos[i];
                  final stock = p["stock"] as int? ?? 0;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      p["nombre"] ?? "Producto",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "SKU: ${p["sku"] ?? "-"}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: stock <= 2 ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "$stock uds",
                        style: TextStyle(
                          color: stock <= 2 ? Colors.red : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Productos más vendidos ───────────────────────────────────────────────────

class ProductosMasVendidosWidget extends StatelessWidget {
  final List<Map<String, dynamic>> productos;

  const ProductosMasVendidosWidget({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Más vendidos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (productos.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text("Sin datos", style: TextStyle(color: Colors.grey)),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productos.length > 5 ? 5 : productos.length,
                itemBuilder: (_, i) {
                  final p = productos[i];
                  final maxVentas = (productos.first["ventas"] as num?)?.toDouble() ?? 1;
                  final ventas = (p["ventas"] as num?)?.toDouble() ?? 0;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                p["nombre"] ?? "Producto",
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${ventas.toInt()} uds",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: maxVentas > 0 ? ventas / maxVentas : 0,
                          backgroundColor: Colors.grey.withOpacity(0.15),
                          color: Colors.blue,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}