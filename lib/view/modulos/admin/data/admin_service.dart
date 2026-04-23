class AdminService {
  Future<List<dynamic>> obtenerProductos() async {
    await Future.delayed(const Duration(seconds: 2)); // mock

    return [
      {'nombre': 'Martillo'},
      {'nombre': 'Taladro'},
    ];
  }
}