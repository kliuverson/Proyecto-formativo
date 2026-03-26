import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../model/cart_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  late Box<CartItem> _cartBox;

  CartBloc() : super(CartInitial()) {
    on<LoadCart>((event, emit) async {
      emit(CartLoading());
      _cartBox = await Hive.openBox<CartItem>('cartBox');
      emit(CartLoaded(_cartBox.values.toList()));
    });

    on<AddToCart>((event, emit) async {
      final index = _cartBox.values.toList().indexWhere((e) => e.id == event.item.id);
      if (index != -1) {
        final existing = _cartBox.get(event.item.id)!;
        final updated = existing.copyWith(quantity: existing.quantity + 1);
        await _cartBox.put(updated.id, updated);
      } else {
        await _cartBox.put(event.item.id, event.item);
      }
      emit(CartLoaded(_cartBox.values.toList()));
    });

    on<RemoveFromCart>((event, emit) async {
      await _cartBox.delete(event.id);
      emit(CartLoaded(_cartBox.values.toList()));
    });

    on<ClearCart>((event, emit) async {
      await _cartBox.clear();
      emit(CartLoaded([]));
    });
  }
}