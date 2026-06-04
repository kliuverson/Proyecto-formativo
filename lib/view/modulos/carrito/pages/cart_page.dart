import 'package:ferremateriales/view/modulos/carrito/widgets/cart_item_card.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/cart_total_section.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/checkout_button.dart';
import 'package:ferremateriales/view/modulos/carrito/widgets/empty_cart_view.dart';
import 'package:ferremateriales/view/modulos/orders/cubit/order_cubit.dart';
import 'package:ferremateriales/view/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
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

        appBar: AppBar(
          title: const Text("Mi Carrito"),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CartError) {
              return Center(child: Text(state.message));
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
                    onPressed: () async {
                      try {
                        final items = state.items.map((item) {
                          return {
                            "productId": item.id,
                            "quantity": item.quantity,
                          };
                        }).toList();

                        final service = PaymentService();

                        final resultStr = await service.createPayment(
                          items: items,
                        );

                        final result = jsonDecode(resultStr);
                        final checkoutUrl = result['checkoutUrl'];
                        final reference = result['reference'];

                        print(items);

                        await launchUrl(
                          Uri.parse(checkoutUrl),
                          mode: LaunchMode.externalApplication,
                        );

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return _PaymentStatusDialog(reference: reference);
                          },
                        ).then((_) {
                          try {
                            context.read<OrderCubit>().getOrders();
                          } catch (_) {}
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error procesando pago: $e")),
                        );
                      }
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


class _PaymentStatusDialog extends StatefulWidget {
  final String reference;

  const _PaymentStatusDialog({required this.reference});

  @override
  State<_PaymentStatusDialog> createState() => _PaymentStatusDialogState();
}

class _PaymentStatusDialogState extends State<_PaymentStatusDialog> {
  Timer? _timer;
  String _statusText = "Comprobando pago...";
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  void _startPolling() {
    final service = PaymentService();
    int attempts = 0;

    _timer = Timer.periodic(const Duration(seconds: 3), (t) async {
      attempts++;
      try {
        final resp = await service.checkPaymentStatus(reference: widget.reference);
        final status = (resp['status'] as String?)?.toLowerCase() ?? '';

        print('checkPaymentStatus resp: $resp');

        if (status == 'paid' || status == 'approved') {
          setState(() {
            _statusText = 'Pago confirmado';
            _done = true;
          });
          _timer?.cancel();
          try {
            context.read<OrderCubit>().getOrders();
          } catch (_) {}
          Future.delayed(const Duration(seconds: 1), () => Navigator.of(context).pop());
          return;
        }
        if (status == 'failed' || status == 'declined' || attempts >= 20) {
          setState(() {
            _statusText = 'Pago no completado';
            _done = true;
          });
          _timer?.cancel();
          Future.delayed(const Duration(seconds: 1), () => Navigator.of(context).pop());
          return;
        }
        setState(() {
          _statusText = 'Estado: ${status.isEmpty ? resp['message'] ?? 'pending' : status}';
        });
      } catch (e) {
        setState(() {
          _statusText = 'Error verificando pago: ${e.toString()}';
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Comprobando pago'),
      content: Row(
        children: [
          if (!_done)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          const SizedBox(width: 12),
          Expanded(child: Text(_statusText)),
        ],
      ),
    );
  }
}