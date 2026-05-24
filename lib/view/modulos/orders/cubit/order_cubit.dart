import 'package:bloc/bloc.dart';
import 'package:ferremateriales/view/modulos/orders/model/order_model.dart';
import 'package:ferremateriales/view/modulos/orders/service/order_service.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  Future<void> getOrders() async {
    emit(state.copyWith(isLoading: true));

    try {
      final orders = await OrderService.getMyOrders();

      emit(state.copyWith(
        isLoading: false,
        orders: orders,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}