import 'package:ferremateriales/view/modulos/productos/data/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {

    // 🔹 GET PRODUCTOS
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Error al cargar productos"));
      }
    });

    // 🔥 CREATE PRODUCT
    on<CreateProduct>((event, emit) async {
      emit(ProductCreating());

      try {
        await repository.createProduct(event.data);

        emit(ProductCreated());

        // 🔄 recargar productos automáticamente
        final products = await repository.getProducts();
        emit(ProductLoaded(products));

      } catch (e) {
        emit(ProductCreateError("Error al crear producto"));
      }
    });
  }
}