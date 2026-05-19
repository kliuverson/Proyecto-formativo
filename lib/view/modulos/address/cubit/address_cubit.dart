import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/view/modulos/address/model/address_model.dart';
import 'package:ferremateriales/view/modulos/address/service/address_service.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressService addressService;

  AddressCubit({
    required this.addressService,
  }) : super(const AddressState());

  Future<void> getAddresses() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final addresses = await addressService.getAddresses();

      emit(
        state.copyWith(
          isLoading: false,
          addresses: addresses,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> createAddress(AddressModel address) async {
    emit(state.copyWith(isLoading: true));

    try {
      await addressService.createAddress(address);

      await getAddresses();

      emit(
        state.copyWith(
          success: "Dirección creada correctamente",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> updateAddress(
    String id,
    AddressModel address,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await addressService.updateAddress(id, address);

      await getAddresses();

      emit(
        state.copyWith(
          success: "Dirección actualizada",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteAddress(String id) async {
    emit(state.copyWith(isLoading: true));

    try {
      await addressService.deleteAddress(id);

      await getAddresses();

      emit(
        state.copyWith(
          success: "Dirección eliminada",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> setPrincipal(String id) async {
    emit(state.copyWith(isLoading: true));

    try {
      await addressService.setPrincipalAddress(id);

      await getAddresses();

      emit(
        state.copyWith(
          success: "Dirección principal actualizada",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}