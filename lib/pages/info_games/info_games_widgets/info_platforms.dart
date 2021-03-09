import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/models/platforms_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/Get.dart';

class InfoPlatforms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'platforms',
      initState: (_) {},
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Platforms', 
            style: TextStyle(
                  fontSize: 20
                ),),
            Container(
              height: Get.height *(_.lenP < 3 ? _.lenP/15 : 4/40),
              width: Get.width*0.90,
              child: GridView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 5,),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 10/4,
                ),
                itemBuilder: (context, index) {
                  final PlatformsModel platfoms = _.platforms[index];
                  return Center(
                    child: Text(platfoms.name, 
                     style: TextStyle(
                      color: Colors.deepPurple
                    ),),
                  );
                },
                itemCount: _.lenP,
              
              )
            ),
          ],
        );
      },
    );
  }
}
