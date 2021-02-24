import 'package:gamesapi/api/games_api.dart';
import 'package:get/get.dart';

import '../models/games_model.dart';

class HomeController extends GetxController {
  List<GamesModel> _games = [];

  List<GamesModel> get games => _games;

  @override
  void onReady() {
    super.onReady();
    this.loadGmaes();
  }

  Future<void> loadGmaes() async {
    final data = await GamesApi.instance.getGames();
    this._games = data;
    update(['games']);
  }
}
