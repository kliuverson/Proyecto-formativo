import 'package:ferremateriales/view/modulos/address/model/address_model.dart';

class AddressService {
  static final List<AddressModel> _addresses = [];

  /// OBTENER DIRECCIONES
  Future<List<AddressModel>> getAddresses() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _addresses;
  }

  /// CREAR DIRECCIÓN
  Future<void> createAddress(AddressModel address) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _addresses.add(address);
  }

  /// ACTUALIZAR DIRECCIÓN
  Future<void> updateAddress(String id, AddressModel updatedAddress) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _addresses.indexWhere((e) => e.id == id);

    if (index != -1) {
      _addresses[index] = updatedAddress;
    }
  }

  /// ELIMINAR DIRECCIÓN
  Future<void> deleteAddress(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _addresses.removeWhere((e) => e.id == id);
  }

  /// ESTABLECER DIRECCIÓN PRINCIPAL
  Future<void> setPrincipalAddress(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    for (int i = 0; i < _addresses.length; i++) {
      final address = _addresses[i];

      _addresses[i] = AddressModel(
        id: address.id,
        nombreDestinatario: address.nombreDestinatario,
        telefono: address.telefono,
        departamento: address.departamento,
        ciudad: address.ciudad,
        direccion: address.direccion,
        referencia: address.referencia,
        codigoPostal: address.codigoPostal,
        principal: address.id == id,
      );
    }
  }
}
