import 'package:flutter/cupertino.dart';

class GamesModel {
  final int id;
  final String name;
  final double totalRating;
  final String cover;
  final String summary;
  final List screens;
  final int releaseData;
  final List genres;
  final List platforms;
  // final String platform;

  GamesModel({
    @required this.id,
    @required this.name,
    this.totalRating,
    this.cover,
    @required this.summary,
    this.screens,
    this.releaseData,
    this.genres,
    this.platforms,
    //this.platform,
  });

  static GamesModel fromJson(Map<String, dynamic> json) {
    return GamesModel(
        id: json['id'],
        name: json['name'],
        totalRating: json['rating'],
        cover: json['cover']['image_id'],
        summary: json['summary'],
        screens: json['screenshots'],
        releaseData: json['first_release_date'],
        genres: json['genres'],
        platforms: json['platforms'],
        //platform: json['platforms']['platform_logo']['url']
        );
  }
}
