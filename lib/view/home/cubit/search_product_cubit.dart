import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductCubit extends Cubit<List> {

  SearchProductCubit() : super([]);

  void searchProducts(String query, List products) {

    if (query.isEmpty) {
      emit(products);
      return;
    }

    final filteredProducts = products.where((product) {

      final productName = product.name.toLowerCase();
      final searchText = query.toLowerCase();

      return productName.contains(searchText);

    }).toList();

    emit(filteredProducts);
  }
}