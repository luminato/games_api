import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/models/similar_games_model.dart';
import 'package:get/state_manager.dart';

class SimilarGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoGamesController>(
      id: 'similar',
      initState: (_) {},
      builder: (_) {
        return Container(
          height: 190,
          width: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final SimilarModel similargames = _.similargames[index];
              if (_.loading) {
                return Center(child: RefreshProgressIndicator());
              }
              return GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    elevation: 5,
                    shadowColor: Colors.purple,
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          'http://images.igdb.com/igdb/image/upload/t_cover_big/${similargames.cover}.jpg',
                          height: 160,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(similargames.name,
                                style: Theme.of(context).textTheme.headline5,
                                overflow: TextOverflow.ellipsis)),
                      )
                    ]),
                  ),
                  onTap: () {});
            },
            itemCount: _.similargames.length
          ),
        );
      },
    );
  }
}
