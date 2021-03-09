import 'package:flutter/cupertino.dart';

class GenresModel {
  final int id;
  final String name;

  GenresModel({
    @required this.id,
    @required this.name,

  });

  static GenresModel fromJson(Map<String, dynamic> json) {
    return GenresModel(
        id: json['id'],
        name: json['name'],
        );
  }
}