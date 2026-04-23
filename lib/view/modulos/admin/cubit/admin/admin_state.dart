// admin_state.dart
abstract class AdminProductState {}

class AdminProductInitial extends AdminProductState {}

class AdminProductLoading extends AdminProductState {}

class AdminProductSuccess extends AdminProductState {
  final Map<String, dynamic> product;

  AdminProductSuccess(this.product);
}

class AdminProductError extends AdminProductState {
  final String message;

  AdminProductError(this.message);
}