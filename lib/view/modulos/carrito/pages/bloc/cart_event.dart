import '../model/cart_model.dart';

abstract class CartEvent {}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final CartItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final String id;
  RemoveFromCart(this.id);
}

class ClearCart extends CartEvent {}