import 'package:flutter/cupertino.dart';

class NewGamesModel {
  final int id;
  final String name;
  final double totalRating;
  final String cover;

  NewGamesModel({
    @required this.id,
    @required this.name,
    this.totalRating,
    this.cover,
  });

  static NewGamesModel fromJson(Map<String, dynamic> json) {
    return NewGamesModel(
      id: json['id'],
      name: json['name'],
      totalRating: json['rating'],
      cover: json['cover']['image_id']
    );
  }
}
