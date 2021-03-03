import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class InfoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'banner',
      initState: (_) {},
      builder: (_) {
        return Container(
          height: Get.height*0.25,
          width: Get.width,
          child: Image.network('http://images.igdb.com/igdb/image/upload/t_cover_big/${_.games.cover}.jpg',
          fit: BoxFit.cover,),
        );
      },
    );
  }
}
