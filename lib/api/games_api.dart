import 'package:dio/dio.dart';
import 'package:gamesapi/models/games_model.dart';

class GamesApi {
  GamesApi._internal();
  static GamesApi _instance = GamesApi._internal();
  static GamesApi get instance => _instance;

  final _dio = Dio();

  var data = {
    'fields': '*; where rating >= 95;',
    //'limit': '10',
    //'where id': ' = 70;'
  };

  Future<List<GamesModel>> getGames() async {
    try {
      final Response response = await this._dio.post(
            'https://api.igdb.com/v4/games',
            queryParameters: data,
            options: Options(
              headers: {
                'Client-ID': '571ekq8zfqvw6hwqsodig6fivev5nh',
                'Authorization': 'Bearer' + ' 4y257vkv0pkzg1wyvl342pbvppl9mg'
              },
            ),
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
