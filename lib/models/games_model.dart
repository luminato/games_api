import 'package:flutter/cupertino.dart';

class GamesModel {
  final int id;
  final String name;
  final double totalRating;
  final List screenshot;

  GamesModel({
    @required this.id,
    @required this.name,
    @required this.totalRating,
    @required this.screenshot,
  });

  static GamesModel fromJson(Map<String, dynamic> json) {
    return GamesModel(
      id: json['id'],
      name: json['name'],
      totalRating: json['rating'],
      screenshot: json['screenshots']
    );
  }
}
