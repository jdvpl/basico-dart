import 'dart:convert';

DataProfile dataProfileFromJson(String str) =>
    DataProfile.fromJson(json.decode(str));

String dataProfileToJson(DataProfile dataProfile) =>
    json.encode(dataProfile.toJson());

class DataProfile {
  DataProfile({
    this.nombre,
    this.apellido,
    this.descripcion,
    this.email,
    this.telefono,
    this.hvlink,
    this.photolink,
  });

  String nombre;
  String apellido;
  String descripcion;
  String email;
  String telefono;
  String hvlink;
  String photolink;

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        nombre: json["nombre"],
        apellido: json["apellido"],
        descripcion: json["descripcion"],
        email: json["email"],
        telefono: json["telefono"],
        hvlink: json["hvlink"],
        photolink: json["photolink"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "descripcion": descripcion,
        "email": email,
        "telefono": telefono,
        "hvlink": hvlink,
        "photolink": photolink,
      };
}
