import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/admin_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminService service;

  AdminCubit(this.service) : super(AdminInitial());

  Future<void> cargarProductos() async {
    emit(AdminLoading());

    try {
      final productos = await service.obtenerProductos();
      emit(AdminSuccess(productos));
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }
}