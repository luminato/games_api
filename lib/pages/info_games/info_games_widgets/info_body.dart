import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_platforms.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_screens.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_summary.dart';
import 'package:get/state_manager.dart';
import 'package:get/Get.dart';

class InfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'info',
      initState: (_) {},
      builder: (_) {
        return Container(
          margin: EdgeInsets.all(20),
          height: Get.height*0.58,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              InfoPlatforms(),
              InfoSummary(),
              SizedBox(height: Get.height*0.01),
              Screens(),
              Text(' ')
            ],),
          ),
        );
      },
    );
  }
}
