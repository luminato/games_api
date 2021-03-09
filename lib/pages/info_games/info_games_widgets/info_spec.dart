import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/models/genres_name.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class InfoSpec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'specfic',
      initState: (_) {},
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(5),
          width: Get.width * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(_.games != null ? _.games.name : _.newGames.name,
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(_
                  .convertData(_.games != null
                      ? _.games.releaseData
                      : _.newGames.releaseData)
                  .toString()),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                height: Get.height * (_.leng/50),
                width: Get.width * 0.55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Genres: ",
                    style: TextStyle(
                      fontSize: 18
                    ),),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        //scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final GenresModel genres = _.genres[index];
                          return Text("${genres.name}, ",
                          style: TextStyle(
                            fontSize: 16
                          ),);
                        },
                        itemCount: _.leng,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
