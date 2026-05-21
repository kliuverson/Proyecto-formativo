import 'package:ferremateriales/view/modulos/orders/cubit/order_cubit.dart';
import 'package:ferremateriales/view/modulos/orders/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  void initState() {
    super.initState();

    context.read<OrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis pedidos"),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {

          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.orders.isEmpty) {
            return const Center(
              child: Text("No tienes pedidos"),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<OrderCubit>().getOrders();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];

                return OrderCard(order: order);
              },
            ),
          );
        },
      ),
    );
  }
}