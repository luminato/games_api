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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Story',
              style: TextStyle(
                  fontSize: 20
                ),),
              SizedBox(height: Get.height*0.02),
              Container(
                // height: Get.height*0.30,
                width: Get.width*0.92,
                child: Text(_.games != null ? _.games.summary : _.newGames.summary, 
                style: TextStyle(
                  fontSize: 16
                ),),
              ),
            ],
          ),
        );
      },
    );
  }
}
