
import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/dashboard/dashboard_cubit.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/dashboard/dashboard_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/dashboard_service.dart';
import 'package:ferremateriales/view/modulos/admin/widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>().state;
    final isAdmin = auth.userData?["esAdmin"] ?? false;

    if (!isAdmin) {
      return const Scaffold(
        body: Center(child: Text("Acceso denegado")),
      );
    }

    final token = auth.token ?? '';

    return BlocProvider(
      create: (_) => DashboardCubit(
        DashboardService(),
        token: token,           // ✅ token del AuthCubit
      )..loadDashboard(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            iconSize: 20,
            padding: const EdgeInsets.all(6),
            icon: const Icon(Icons.refresh),
            tooltip: "Actualizar",
            onPressed: () => context.read<DashboardCubit>().refresh(),
          ),
        ],
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading || state is DashboardInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DashboardError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(state.message, textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 33),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    onPressed: () => context.read<DashboardCubit>().loadDashboard(),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text("Reintentar"),
                  ),
                ],
              ),
            );
          }

          if (state is DashboardLoaded) {
            return _DashboardContent(data: state.data);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardData data;
  const _DashboardContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<DashboardCubit>().refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resumen general",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Estado actual de tu ferretería",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 20),
            MetricsGrid(data: data),
            const SizedBox(height: 20),
            PedidosRecientesWidget(pedidos: data.pedidosRecientes),
            const SizedBox(height: 16),
            StockCriticoWidget(productos: data.productosStockCritico),
              const SizedBox(height: 16),
              ProductosMasVendidosWidget(productos: data.productosMasVendidos),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}