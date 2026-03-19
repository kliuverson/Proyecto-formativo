import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class SearchProductCubit extends Cubit<List<ProductModel>> {

  SearchProductCubit() : super([]);

  List<ProductModel> _allProducts = [];

  /// 🔹 Cargar productos UNA VEZ
  void setProducts(List<ProductModel> products) {
    _allProducts = products;
    emit(products);
  }

  /// 🔍 Buscar
  void searchProducts(String query) {

    if (query.isEmpty) {
      emit(_allProducts);
      return;
    }

    final filteredProducts = _allProducts.where((product) {

      final productName = product.nombre.toLowerCase();
      final searchText = query.toLowerCase();

      return productName.contains(searchText);

    }).toList();

    emit(filteredProducts);
  }
}