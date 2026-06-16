import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';
import 'package:ferremateriales/view/modulos/productos/service/product_service.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

// 👇 IMPORTS NUEVOS
import 'widgets/product_grid.dart';
import 'widgets/product_list.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _isGrid = true;
  List<ProductModel> productos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    try {
      final lista = await ProductService.getProducts();
      print('[ProductListPage] Productos obtenidos: ${lista.length}');
      setState(() {
        productos = lista;
        _isLoading = false;
      });
    } catch (e) {
      print('[ProductListPage] Error cargando productos: $e');
      setState(() {
        productos = [];
        _isLoading = false;
      });
    }
  }

  void _navegarDetalle(BuildContext context, ProductModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetail(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.productListTitle),
        actions: [
          IconButton(
            icon: Icon(_isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGrid = !_isGrid;
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _isGrid
              ? ProductGrid(
                  productos: productos,
                  onTap: (product) => _navegarDetalle(context, product),
                )
              : ProductList(
                  productos: productos,
                  onTap: (product) => _navegarDetalle(context, product),
                ),
    );
  }
}

