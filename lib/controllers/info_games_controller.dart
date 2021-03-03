import 'package:gamesapi/api/similar_games_api.dart';
import 'package:gamesapi/models/games_model.dart';
import 'package:gamesapi/models/similar_games_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class InfoGamesController extends GetxController {
  List<SimilarModel> _similargames = [];
  bool _loading = true;
  
  GamesModel _game;
  GamesModel get games => _game;

  get loading => _loading;
  List<SimilarModel> get similargames => _similargames;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._game = Get.arguments[0] as GamesModel;
    this.id = Get.arguments[1];
    
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    this.loadGames();
    
  }

var id = Get.arguments[1];


  Future<void> loadGames() async {
    final data = await SimilarGamesApi.instance.getSimilar();
    this._similargames = data;
    _loading = false;
    update(['similar']);
  }
}
