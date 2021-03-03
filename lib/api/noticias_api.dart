import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:gamesapi/models/noticias_model.dart';

const API_KEY = 'AIzaSyCC9_z80iHQ64nXaiIF3WGj6YhTIst8Al4';

class YoutubeApi {
  YoutubeApi._internal();
  static YoutubeApi _instance = YoutubeApi._internal();
  static YoutubeApi get instance => _instance;

  Future<List<YoutubeModel>> getVideos() async {
    http.Response response = await http.get(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=gametrailers&type=video&key=$API_KEY&maxResults=10',
    );

    List<YoutubeModel> decode(http.Response response) {
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);

        List<YoutubeModel> videos = decoded['items']
            .map<YoutubeModel>((e) => YoutubeModel.fromJson(e))
            .toList();
        return videos;
      } else {
        throw Exception('falha a carregar video');
      }
    }

    return decode(response);
  }
}
