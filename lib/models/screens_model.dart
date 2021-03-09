import 'package:flutter/cupertino.dart';

class ScreensModel {
  final int id;
  final String imageId;

  ScreensModel({
    @required this.id,
    @required this.imageId,

  });

  static ScreensModel fromJson(Map<String, dynamic> json) {
    return ScreensModel(
        id: json['id'],
        imageId: json['image_id'],
        );
  }
}
