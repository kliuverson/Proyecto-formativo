import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class SearchProductState {
  final List<ProductModel> products;
  final bool isLoading;

  const SearchProductState({
    required this.products,
    required this.isLoading,
  });
}

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit()
      : super(const SearchProductState(products: [], isLoading: true));

  List<ProductModel> _allProducts = [];

  /// Cargar productos UNA VEZ
  void setProducts(List<ProductModel> products) {
    _allProducts = products;
    emit(SearchProductState(products: products, isLoading: false));
  }

  /// Buscar
  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(SearchProductState(products: _allProducts, isLoading: false));
      return;
    }

    final filtered = _allProducts.where((product) {
      final nombre = product.nombre.toLowerCase();
      final sku = product.sku.toLowerCase();
      final categoria = product.category.toLowerCase();
      final search = query.toLowerCase();

      return nombre.contains(search) ||
          sku.contains(search) ||
          categoria.contains(search);
    }).toList();

    emit(SearchProductState(products: filtered, isLoading: false));
  }
}