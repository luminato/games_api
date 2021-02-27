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
        return Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Top Games',
              style: Theme.of(context).textTheme.headline4
              ),
            ),
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final GamesModel games = _.games[index];
                  if (_.loading) {
                    return Center(child: LinearProgressIndicator());
                  }
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    elevation: 5,
                    shadowColor: Colors.purple,
                    //shadowColor: Colors.black,
                    // child: ListTile(
                    //   leading: Image.network(
                    //       'http://images.igdb.com/igdb/image/upload/t_thumb/${games.cover}.jpg'),
                    //   title: Text(games.name),
                    //   subtitle: Text(games.totalRating.toStringAsFixed(1)),
                    // ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          child: Image.network(
                             'http://images.igdb.com/igdb/image/upload/t_logo_med/${games.cover}.jpg',
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
                            child: Text(games.name,
                              style: Theme.of(context).textTheme.headline5,
                              overflow: TextOverflow.ellipsis
                            )),
                        )
                      ]
                      ),
                  );
                },
                itemCount: _.games.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
