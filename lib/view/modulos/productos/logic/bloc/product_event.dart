abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}
class CreateProduct extends ProductEvent {
  final Map<String, dynamic> data;

  CreateProduct(this.data);
}