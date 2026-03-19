import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/service/product_service.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());

  Future<void> loadByCategory(String category) async {
    try {
      emit(CategoryProductLoading());

      final products = await ProductService.getProductsByCategory(category);

      emit(CategoryProductLoaded(products));
    } catch (e) {
      emit(CategoryProductError());
    }
  }
}
