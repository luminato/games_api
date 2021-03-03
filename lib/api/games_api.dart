import 'package:dio/dio.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:gamesapi/key/api_key.dart';
import 'package:gamesapi/models/games_model.dart';

final HomeController home = HomeController();

class GamesApi {
  GamesApi._internal();
  static GamesApi _instance = GamesApi._internal();
  static GamesApi get instance => _instance;

  final _dio = Dio();

  List<int> g = home.platform;

  Future<List<GamesModel>> getGames() async {
    try {
      final Response response = await this._dio.post(
        'https://api.igdb.com/v4/games',

        options: Options(
          headers: {
            'Client-ID': ClientID,
            'Authorization': Autorization
          },
        ),
        queryParameters: {
          'fields': 'name, cover.image_id,'
              ' genres.name, rating, summary,'
              ' total_rating, release_dates.platform;'
              'where release_dates.platform = (${g.join(",")}) & cover != null & total_rating >= 80 & rating != null;'
              'sort rating desc',
        },
        //data: data
      );

      print(response.data);
      return (response.data as List)
          .map((e) => GamesModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

/*
48 - ps4
49 - xbox one
6 - pc
14 - mac
3 - linux
39 - ios
34 - android
11 - xbox
*/
