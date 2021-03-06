import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:gamesapi/models/new_games_models.dart';
import 'package:get/state_manager.dart';

class FreeGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'newgames',
      initState: (_) {},
      builder: (_) {
        return Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('New Games',
              style: Theme.of(context).textTheme.headline4
              ),
            ),
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final NewGamesModel newGames = _.newGames[index];
                  if (_.loading) {
                    return Center(child: LinearProgressIndicator());
                  }
                  return GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      //shadowColor: Colors.black,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: Image.network(
                               'http://images.igdb.com/igdb/image/upload/t_logo_med/${newGames.cover}.jpg',
                               height: 160,
                               width: 120,
                               fit: BoxFit.cover,
                               ),
                          ),
                          SizedBox(height: 4,),
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              child: Text(newGames.name,
                                style: Theme.of(context).textTheme.headline5,
                                overflow: TextOverflow.ellipsis
                              )),
                          )
                        ]
                        ),
                    ),
                    onTap: () => _.showInfoNewGames(newGames),
                  );
                },
                itemCount: _.newGames.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
