import 'dart:convert';

import 'package:qr_reader_flutter/models/models.dart';

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    type = value.contains('https') ? TypeScan.https : TypeScan.geo;
  }

  int? id;
  TypeScan? type;
  String value;

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"] == "https" ? TypeScan.https : TypeScan.geo,
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type!.name,
        "value": value,
      };
}

enum TypeScan { https, geo }
