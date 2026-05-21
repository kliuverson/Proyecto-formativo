import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String id;
  final String nombreDestinatario;
  final String telefono;
  final String departamento;
  final String ciudad;
  final String direccion;
  final String referencia;
  final String codigoPostal;
  final bool principal;

  const AddressModel({
    required this.id,
    required this.nombreDestinatario,
    required this.telefono,
    required this.departamento,
    required this.ciudad,
    required this.direccion,
    required this.referencia,
    required this.codigoPostal,
    required this.principal,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["_id"] ?? "",
      nombreDestinatario: json["nombreDestinatario"] ?? "",
      telefono: json["telefono"] ?? "",
      departamento: json["departamento"] ?? "",
      ciudad: json["ciudad"] ?? "",
      direccion: json["direccion"] ?? "",
      referencia: json["referencia"] ?? "",
      codigoPostal: json["codigoPostal"] ?? "",
      principal: json["principal"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombreDestinatario": nombreDestinatario,
      "telefono": telefono,
      "departamento": departamento,
      "ciudad": ciudad,
      "direccion": direccion,
      "referencia": referencia,
      "codigoPostal": codigoPostal,
      "principal": principal,
    };
  }

  AddressModel copyWith({
    String? id,
    String? nombreDestinatario,
    String? telefono,
    String? departamento,
    String? ciudad,
    String? direccion,
    String? referencia,
    String? codigoPostal,
    bool? principal,
  }) {
    return AddressModel(
      id: id ?? this.id,
      nombreDestinatario:
          nombreDestinatario ?? this.nombreDestinatario,
      telefono: telefono ?? this.telefono,
      departamento: departamento ?? this.departamento,
      ciudad: ciudad ?? this.ciudad,
      direccion: direccion ?? this.direccion,
      referencia: referencia ?? this.referencia,
      codigoPostal: codigoPostal ?? this.codigoPostal,
      principal: principal ?? this.principal,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nombreDestinatario,
        telefono,
        departamento,
        ciudad,
        direccion,
        referencia,
        codigoPostal,
        principal,
      ];
}