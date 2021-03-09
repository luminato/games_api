import 'package:flutter/cupertino.dart';

class PlatformsModel {
  final int id;
  final String name;

  PlatformsModel({
    @required this.id,
    @required this.name,

  });

  static PlatformsModel fromJson(Map<String, dynamic> json) {
    return PlatformsModel(
        id: json['id'],
        name: json['name'],
        );
  }
}