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
        if (_.loading) {
          return Center(child: LinearProgressIndicator());
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final GamesModel games = _.games[index];
            return Card(
              //shadowColor: Colors.black,
              child: ListTile(
                title: Text(games.name),
                subtitle: Text(games.totalRating.toStringAsFixed(1)),
              ),
            );
          },
          itemCount: _.games.length,
        );
      },
    );
  }
}
