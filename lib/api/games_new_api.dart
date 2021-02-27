import 'package:dio/dio.dart';
import 'package:gamesapi/models/games_model.dart';
import 'package:gamesapi/models/new_games_models.dart';

class NewGamesApi {
  NewGamesApi._internal();
  static NewGamesApi _instance = NewGamesApi._internal();
  static NewGamesApi get instance => _instance;

  final _dio = Dio();

  var data = {};

  Future<List<NewGamesModel>> getGames() async {
    try {
      final Response response =
          await this._dio.post('https://api.igdb.com/v4/games',
              options: Options(
                headers: {
                  'Client-ID': '571ekq8zfqvw6hwqsodig6fivev5nh',
                  'Authorization': 'Bearer' + ' 4y257vkv0pkzg1wyvl342pbvppl9mg'
                },
              ),
              queryParameters: {
                'fields': 'name, cover.image_id, platforms.platform_logo.url,'
                    ' genres.name, first_release_date, release_dates.human, age_ratings.*, rating,'
                    ' total_rating; where cover != null & release_dates.human != null & release_dates.human != "TBD"; sort first_release_date desc;',
              },
              data: data);

      print(response.data);
      return (response.data as List)
          .map((e) => NewGamesModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}