import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_cubit.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/modulos/admin/widgets/product_form.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminProductCubit(ProductService()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Crear Producto")),
        body: BlocConsumer<AdminProductCubit, AdminProductState>(
          listener: (context, state) {
            if (state is AdminProductSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Producto creado correctamente")),
              );
            }

            if (state is AdminProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AdminProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ProductForm(
              onSubmit: (data) {
                final cubit = context.read<AdminProductCubit>();

                cubit.createProduct(
                  sku: data['sku'] ?? '',
                  nombre: data['nombre'] ?? '',
                  precio: data['precio'] is double
                      ? data['precio'] as double
                      : double.parse(data['precio'].toString()),
                  stock: data['stock'] is int
                      ? data['stock'] as int
                      : int.parse(data['stock'].toString()),
                  image: data['image'] ?? '',
                  descripcion: data['descripcion'],
                );
              },
            );
          },
        ),
      ),
    );
  }
}