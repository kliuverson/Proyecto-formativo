import 'package:ferremateriales/view/modulos/address/model/address_model.dart';

class AddressService {

  final List<AddressModel> _addresses = [];

  /// OBTENER DIRECCIONES
  Future<List<AddressModel>> getAddresses() async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List.from(_addresses);
  }

  /// CREAR DIRECCIÓN
  Future<void> createAddress(
    AddressModel address,
  ) async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    _addresses.add(address);
  }

  /// ACTUALIZAR DIRECCIÓN
  Future<void> updateAddress(
    String id,
    AddressModel updatedAddress,
  ) async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final index = _addresses.indexWhere(
      (e) => e.id == id,
    );

    if (index != -1) {
      _addresses[index] = updatedAddress;
    }
  }

  /// ELIMINAR DIRECCIÓN
  Future<void> deleteAddress(String id) async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    _addresses.removeWhere(
      (e) => e.id == id,
    );
  }

  /// ESTABLECER DIRECCIÓN PRINCIPAL
  Future<void> setPrincipalAddress(
    String id,
  ) async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    for (int i = 0; i < _addresses.length; i++) {

      final current = _addresses[i];

      _addresses[i] = current.copyWith(
        principal: current.id == id,
      );
    }
  }
}