import 'package:flutter/cupertino.dart';

class SimilarModel {
  final int id;
  final String name;
  final double totalRating;
  final String cover;
  //final String summary;


  SimilarModel({
    @required this.id,
    @required this.name,
    this.totalRating,
    this.cover,
    //this.summary
  });

  static SimilarModel fromJson(Map<String, dynamic> json) {
    return SimilarModel(
      id: json['similar_games']['id'],
      name: json['similar_games']['name'],
      totalRating: json['similar_games']['rating'],
      cover: json['similar_games']['cover']['image_id'],
      //summary: json['similar_games']['summary']

    );
  }
}
