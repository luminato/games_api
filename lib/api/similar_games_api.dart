import 'package:dio/dio.dart';
import 'package:gamesapi/controllers/info_games_controller.dart';
import 'package:gamesapi/key/api_key.dart';
import 'package:gamesapi/models/similar_games_model.dart';

final InfoGamesController info = InfoGamesController();

class SimilarGamesApi {
  SimilarGamesApi._internal();
  static SimilarGamesApi _instance = SimilarGamesApi._internal();
  static SimilarGamesApi get instance => _instance;

  final _dio = Dio();

  var data = {};

  int id = info.id;

  Future<List<SimilarModel>> getSimilar() async {
    try {
      final Response response =
          await this._dio.post('https://api.igdb.com/v4/games',
              options: Options(
                headers: {
                  'Client-ID': ClientID,
                  'Authorization': Autorization
                },
              ),
              queryParameters: {
                'fields':
                    '*, similar_games.id, similar_games.name, similar_games.rating, similar_games.cover.*, similar_games.summary;'
                        'where id = $id & cover != null;',
              },
              data: data);
      print(response.data);
      return (response.data as List)
          .map((e) => SimilarModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
