part of 'order_cubit.dart';

class OrderState {
  final bool isLoading;
  final List<OrderModel> orders;
  final String? error;

  OrderState({
    required this.isLoading,
    required this.orders,
    this.error,
  });

  factory OrderState.initial() {
    return OrderState(
      isLoading: false,
      orders: [],
    );
  }

  OrderState copyWith({
    bool? isLoading,
    List<OrderModel>? orders,
    String? error,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
      error: error,
    );
  }
}