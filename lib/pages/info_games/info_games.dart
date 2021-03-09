import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_banner.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_body.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_image_profile.dart';
import 'package:gamesapi/pages/info_games/info_games_widgets/info_spec.dart';

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
          // appBar: AppBar(),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: InfoBanner(),
              ),
              Positioned(
                top: 25,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                  color: Colors.white,
                  size: 30,),
                  onPressed: () => Get.back(),
                  ),
              ),
              Positioned(
                top: Get.height*0.16,
                left: Get.width*0.05,
                child: InfoImageProfile(),
              ),
              Positioned(
                top: Get.height*0.25,
                left: Get.width*0.42,
                child: InfoSpec(),
              ),
              Positioned(
                top: Get.height*0.42,
                child: InfoBody()
                  
                
              ),
            ],
          ),
        );
      },
    );
  }
}
