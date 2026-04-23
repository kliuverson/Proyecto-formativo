// product_cubit.dart
import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/admin_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProductCubit extends Cubit<AdminProductState> {
  final ProductService service;

  AdminProductCubit(this.service) : super(AdminProductInitial());

  Future<void> createProduct({
    required String sku,
    required String nombre,
    required double precio,
    required int stock,
    required String image,
    String? descripcion,
    String? category,
  }) async {
    emit(AdminProductLoading());

    try {
      final data = {
        "sku": sku,
        "nombre": nombre,
        "precio": precio,
        "stock": stock,
        "image": image,
        "descripcion": descripcion,
        "category": category
      };

      final result = await service.createProduct(data);

      emit(AdminProductSuccess(result));
    } catch (e) {
      emit(AdminProductError(e.toString()));
    }
  }
}