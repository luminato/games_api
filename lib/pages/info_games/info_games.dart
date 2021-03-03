import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_banner.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_image_profile.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_similar.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_spec.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_summary.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class InfoGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      init: InfoGamesController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: InfoBanner(),
              ),
              Positioned(
                top: Get.height*0.16,
                left: Get.width*0.05,
                child: InfoImageProfile(),
              ),
              Positioned(
                top: Get.height*0.27,
                left: Get.width*0.42,
                child: InfoSpec(),
              ),
              Positioned(
                top: Get.height*0.50,
                child: InfoSummary(),),
              Positioned(
                top: Get.height*0.80,
                child: SimilarGames(),
                )
            ],
          ),
        );
      },
    );
  }
}
