import 'package:dio/dio.dart';
import 'package:gamesapi/models/games_model.dart';

class GamesApi {
  GamesApi._internal();
  static GamesApi _instance = GamesApi._internal();
  static GamesApi get instance => _instance;

  final _dio = Dio();

  var data = {};

  Future<List<GamesModel>> getGames() async {
    try {
      final Response response = await this._dio.post(
        'https://api.igdb.com/v4/games',

        options: Options(
          headers: {
            'Client-ID': '571ekq8zfqvw6hwqsodig6fivev5nh',
            'Authorization': 'Bearer' + ' 4y257vkv0pkzg1wyvl342pbvppl9mg'
          },
        ),
        queryParameters: {
          'fields': 'name, cover.image_id, platforms.platform_logo.url,'
              ' genres.name, release_dates.human, age_ratings.*, rating,'
              ' total_rating; where cover != null & rating <= 96 & total_rating >= 80 & rating != null; sort rating desc',
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
