import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/home/widgets/product_card.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';
import 'package:ferremateriales/view/modulos/productos/service/product_service.dart';

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
      // DEBUG
      // ignore: avoid_print
      print('[ProductListPage] Productos obtenidos: ${lista.length}');
      setState(() {
        productos = lista;
        _isLoading = false;
      });
    } catch (e) {
      // DEBUG
      // ignore: avoid_print
      print('[ProductListPage] Error cargando productos: $e');
      setState(() {
        productos = ProductService.getStaticProducts();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
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
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _isGrid
              ? _buildGrid()
              : _buildList(),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final product = productos[index];
        return ProductCard(
          product: product,
          onTap: () => _navegarDetalle(context, product),
        );
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final product = productos[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  product.image.isNotEmpty
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                        ),
                      )
                      : Icon(Icons.image, size: 30, color: Colors.grey[600]),
            ),
            title: Text(
              product.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '\$${product.precio.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegarDetalle(context, product),
          ),
        );
      },
    );
  }
}
