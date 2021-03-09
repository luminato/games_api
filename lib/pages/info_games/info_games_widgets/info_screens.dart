import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/models/screens_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/Get.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'screens',
      initState: (_) {},
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('ScreensShot',
              style: TextStyle(
                  fontSize: 20
                ),),
            ),
            Container(
              height: Get.height * 0.20,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final ScreensModel screens = _.screens[index];
                  return Card(
                    child: Image.network(
                        'http://images.igdb.com/igdb/image/upload/t_cover_big/${screens.imageId}.jpg',
                        fit: BoxFit.cover,
                        // height: Get.height*0.10,
                        // width: Get.width*0.15,
                        ),
                  );
                  
                },
                itemCount: _.len
              ),
            ),
            Text('')
          ],
        );
      },
    );
  }
}
