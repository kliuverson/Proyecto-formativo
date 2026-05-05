import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/service/product_service.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());

  Future<void> loadByCategory(String category) async {
    try {
      emit(CategoryProductLoading());

      debugPrint('[CategoryProductCubit] cargando categoría: $category');

      final products = await ProductService.getProductsByCategory(category);

      debugPrint(
        '[CategoryProductCubit] productos obtenidos: ${products.length}',
      );

      emit(CategoryProductLoaded(products));
    } catch (e) {
      debugPrint('[CategoryProductCubit] error cargando: $e');
      emit(CategoryProductError());
    }
  }

  Future<void> loadProductsByCategory(String categoryName) async {
    return loadByCategory(categoryName);
  }
}
