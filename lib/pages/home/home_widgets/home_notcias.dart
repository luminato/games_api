import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:gamesapi/models/noticias_model.dart';
import 'package:get/state_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Noticias extends StatelessWidget {
  Widget titleChanel(String title) {
    return Positioned(
      top: 0,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(90, 70),
                topLeft: Radius.elliptical(90, 70),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }

  Widget description(String title) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 100,
        width: 400,
        decoration: BoxDecoration(color: Colors.black38),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'youtube',
      initState: (_) {},
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'trailers',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            AspectRatio(
              aspectRatio: 16.0 / 12,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final YoutubeModel video = _.videos[index];
                  return Container(
                    child: Stack(
                      children: [
                        Container(
                          child: Image.network(
                            video.thumb,
                            fit: BoxFit.cover,
                          ),
                        ),
                        titleChanel(video.chanel),
                        description(video.title),
                        IconButton(
                          icon: Icon(Icons.play_arrow_rounded),
                          iconSize: 30,
                          onPressed: () {
                            YoutubePlayerController _controller = YoutubePlayerController(
                                initialVideoId: video.id,
                                flags: YoutubePlayerFlags(
                                  startAt: 0)
                            );
                            YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.purple,

                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _.videos.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
