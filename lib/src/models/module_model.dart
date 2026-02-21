import 'package:hive/hive.dart';

class ModuleModel {
  final String id;
  final String title;
  final String description;
  final double price;

  ModuleModel({required this.id, required this.title, required this.description, required this.price});

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
    };
  }
}

class ModuleAdapter extends TypeAdapter<ModuleModel> {
  @override
  final int typeId = 0;

  @override
  ModuleModel read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final description = reader.readString();
    final price = reader.readDouble();
    return ModuleModel(id: id, title: title, description: description, price: price);
  }

  @override
  void write(BinaryWriter writer, ModuleModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeDouble(obj.price);
  }
}
