import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class InfoSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'summary',
      initState: (_) {},
      builder: (_) {
        return Container(
          height: Get.height*0.40,
          width: Get.width*0.95,
          child: Text(_.games.summary),
        );
      },
    );
  }
}
