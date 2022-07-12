// ignore_for_file: file_names

import 'dart:convert';

ProvinceModel provinceModelFromJson(String str) => ProvinceModel.fromJson(json.decode(str));

class ProvinceModel {
  ProvinceModel({
    this.statusCode,
    this.errorDescription,
    this.data,
  });

  int? statusCode;
  String? errorDescription;
  List<Datum>? data;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        statusCode: json["status_code"],
        errorDescription: json["error_description"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.picture,
    this.pakaianAdat,
    this.tarianAdat,
    this.rumahAdat,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? picture;
  Adat? pakaianAdat;
  Adat? tarianAdat;
  Adat? rumahAdat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        picture: json["picture"],
        pakaianAdat: json["pakaian_adat"] == null ? null : Adat.fromJson(json["pakaian_adat"]),
        tarianAdat: json["tarian_adat"] == null ? null : Adat.fromJson(json["tarian_adat"]),
        rumahAdat: json["rumah_adat"].isEmpty ? null : Adat.fromJson(json["rumah_adat"]),
      );
}

class Adat {
  Adat({
    this.title,
    this.description,
    this.picture,
  });

  String? title;
  String? description;
  String? picture;

  factory Adat.fromJson(Map<String, dynamic> json) => Adat(
        title: json["title"],
        description: json["description"],
        picture: json["picture"],
      );
}
