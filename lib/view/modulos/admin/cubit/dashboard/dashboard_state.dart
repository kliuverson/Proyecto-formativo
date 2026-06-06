// dashboard_state.dart

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final DashboardData data;
  DashboardLoaded(this.data);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

class DashboardData {
  final double ventasTotales;
  final double ventasHoy;
  final int totalPedidos;
  final int pedidosPendientes;
  final int totalProductos;
  final int productosStockBajo;
  final int totalClientes;
  final int clientesNuevos;
  final List<Map<String, dynamic>> ventasPorMes;
  final List<Map<String, dynamic>> productosMasVendidos;
  final List<Map<String, dynamic>> pedidosRecientes;
  final List<Map<String, dynamic>> productosStockCritico;

  const DashboardData({
    required this.ventasTotales,
    required this.ventasHoy,
    required this.totalPedidos,
    required this.pedidosPendientes,
    required this.totalProductos,
    required this.productosStockBajo,
    required this.totalClientes,
    required this.clientesNuevos,
    required this.ventasPorMes,
    required this.productosMasVendidos,
    required this.pedidosRecientes,
    required this.productosStockCritico,
  });
}