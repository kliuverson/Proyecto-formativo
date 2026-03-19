import 'package:ferremateriales/view/home/widgets/product_card.dart';
import 'package:ferremateriales/view/modulos/category/cubit/category_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'product_details.dart';

class ProductsByCategoryPage extends StatelessWidget {
  final String categoryName;

  const ProductsByCategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),

      body: BlocBuilder<CategoryProductCubit, CategoryProductState>(
        builder: (context, state) {
          if (state is CategoryProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CategoryProductError) {
            return const Center(child: Text("Error cargando productos"));
          }

          if (state is CategoryProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(
                child: Text("No hay productos en esta categoría"),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
