// dashboard_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/dashboard/dashboard_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/dashboard_service.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardService service;
  final String token;

  DashboardCubit(this.service, {required this.token}) : super(DashboardInitial());

  Future<void> loadDashboard() async {
    emit(DashboardLoading());

    try {
      final raw = await service.getDashboardData(token);

      Map<String, dynamic> toMap(dynamic value) {
        if (value == null) return {};
        return Map<String, dynamic>.from(value as Map);
      }

      List<Map<String, dynamic>> toList(dynamic value) {
        if (value == null || value is! List) return [];
        return value.map((e) => Map<String, dynamic>.from(e as Map)).toList();
      }

      final ventas   = toMap(raw["ventas"]);
      final pedidos  = toMap(raw["pedidos"]);
      final productos = toMap(raw["productos"]);
      final clientes = toMap(raw["clientes"]);

      final data = DashboardData(
        ventasTotales:        (ventas["total"]       as num?)?.toDouble() ?? 0,
        ventasHoy:            (ventas["hoy"]         as num?)?.toDouble() ?? 0,
        totalPedidos:         (pedidos["total"]      as num?)?.toInt()    ?? 0,
        pedidosPendientes:    (pedidos["pendientes"] as num?)?.toInt()    ?? 0,
        totalProductos:       (productos["total"]    as num?)?.toInt()    ?? 0,
        productosStockBajo:   (productos["stockBajo"]as num?)?.toInt()    ?? 0,
        totalClientes:        (clientes["total"]     as num?)?.toInt()    ?? 0,
        clientesNuevos:       (clientes["nuevos"]    as num?)?.toInt()    ?? 0,
        ventasPorMes:         toList(raw["ventasPorMes"]),
        productosMasVendidos: toList(raw["productosMasVendidos"]),
        pedidosRecientes:     toList(raw["pedidosRecientes"]),
        productosStockCritico: toList(raw["stockCritico"]),
      );

      emit(DashboardLoaded(data));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  Future<void> refresh() => loadDashboard();
}