import 'package:gamesapi/api/games_api.dart';
import 'package:gamesapi/api/games_new_api.dart';
import 'package:gamesapi/models/new_games_models.dart';
import 'package:get/get.dart';

import '../models/games_model.dart';

class HomeController extends GetxController {
  List<GamesModel> _games = [];
  List<NewGamesModel> _newGames = [];
  bool _loading = true;
  bool _newLoading = true;

  get loading => _loading;
  get newLoading => _newLoading;
  List<GamesModel> get games => _games;
  List<NewGamesModel> get newGames => _newGames;

  @override
  void onReady() {
    super.onReady();
    this.loadGames();
    this.loadNewGames();
  }

  Future<void> loadGames() async {
    final data = await GamesApi.instance.getGames();
    this._games = data;
    _loading = false;
    update(['games']);
  }

  Future<void> loadNewGames() async {
    final data = await NewGamesApi.instance.getGames();
    this._newGames = data;
    _newLoading = false;
    update(['newgames'], _loading == false);
  }
}
