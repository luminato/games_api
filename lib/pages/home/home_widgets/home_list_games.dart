import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:gamesapi/models/games_model.dart';
import 'package:get/state_manager.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'games',
      builder: (_) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final GamesModel games = _.games[index];
            return ListTile(
              title: Text(games.id.toString()),
              subtitle: Text(games.name),
            );
          },
          itemCount: _.games.length,
        );
      },
    );
  }
}
