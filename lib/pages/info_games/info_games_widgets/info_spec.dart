import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:get/state_manager.dart';

class InfoSpec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'specfic',
      initState: (_) {},
      builder: (_) {
        return Container(
          child: Column(children: [
            Text(_.games.name,
            style: TextStyle(
              fontSize: 18
            ))
          ],),
        );
      },
    );
  }
}
