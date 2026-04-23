import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_state.dart';
import 'package:ferremateriales/view/modulos/productos/logic/bloc/product_bloc.dart';
import 'package:ferremateriales/view/modulos/productos/logic/bloc/product_event.dart';
import 'package:ferremateriales/view/modulos/productos/logic/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:ferremateriales/view/modulos/admin/widgets/product_form.dart';



class CreateProductPage extends StatelessWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>().state;
    final isAdmin = auth.userData?["esAdmin"] ?? false;

    // 🔐 PROTECCIÓN
    if (!isAdmin) {
      return const Scaffold(
        body: Center(child: Text("Acceso denegado")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Crear Producto")),

      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Producto creado correctamente")),
            );

            Navigator.pop(context); // 🔥 vuelve atrás
          }

          if (state is ProductCreateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductCreating) {
            return const Center(child: CircularProgressIndicator());
          }

          return ProductForm(
            onSubmit: (data) {
              context.read<ProductBloc>().add(CreateProduct(data));
            },
          );
        },
      ),
    );
  }
}