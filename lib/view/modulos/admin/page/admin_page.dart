import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_cubit.dart';
import 'package:ferremateriales/view/modulos/admin/cubit/admin/admin_state.dart';
import 'package:ferremateriales/view/modulos/admin/data/admin_service.dart';
import 'package:ferremateriales/view/modulos/admin/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminCubit(AdminService())..cargarProductos(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Modo Admin')),
        body: BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            if (state is AdminLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AdminError) {
              return Center(child: Text(state.message));
            }

            if (state is AdminSuccess) {
              return ProductList(productos: state.productos);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}