part of 'category_product_cubit.dart';

sealed class CategoryProductState extends Equatable {
  const CategoryProductState();

  @override
  List<Object> get props => [];
}

final class CategoryProductInitial extends CategoryProductState {}

class CategoryProductLoading extends CategoryProductState {}


class CategoryProductLoaded extends CategoryProductState {
  final List<ProductModel> products;

  const CategoryProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class CategoryProductError extends CategoryProductState {}
