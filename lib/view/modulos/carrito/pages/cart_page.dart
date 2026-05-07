import 'package:ferremateriales/view/modulos/carrito/widgets/cart_item_card.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/cart_total_section.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/checkout_button.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/empty_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';
import 'bloc/cart_state.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(LoadCart()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Mi Carrito"),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CartError) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is CartLoaded) {
              if (state.items.isEmpty) {
                return const EmptyCartView();
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];

                        return CartItemCard(item: item);
                      },
                    ),
                  ),

                  CartTotalSection(total: state.total),

                  CheckoutButton(
                    onPressed: () {
                      context.read<CartBloc>().add(ClearCart());
                    },
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}