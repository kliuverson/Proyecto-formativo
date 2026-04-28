class UserProfileModel{
  String nombre;
  String apellido;
  String username;
  String correo;
  String numeroTelefono;

  UserProfileModel({
    required this.nombre,
    required this.apellido,
    required this.username,
    required this.correo,
    required this.numeroTelefono,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
      username: json['username'] ?? '',
      correo: json['correo'] ?? '',
      numeroTelefono: json['numeroTelefono'] ?? '',
    );
  }
}