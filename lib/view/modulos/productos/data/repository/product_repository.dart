import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import '../providers/product_api_provider.dart';
import 'package:hive/hive.dart';

class ProductRepository {
  final apiProvider = ProductApiProvider();

  Future<List<ProductModel>> getProducts() async {
    try {
      final products = await apiProvider.fetchProducts();
      var box = await Hive.openBox<ProductModel>('productBox');
      for (var p in products) {
        box.put(p.sku, p);
      }
      return products;
    } catch (_) {
      // Si falla la API, carga desde Hive
      var box = await Hive.openBox<ProductModel>('productBox');
      return box.values.toList();
    }
  }
}