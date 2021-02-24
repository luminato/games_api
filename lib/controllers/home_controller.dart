import 'package:gamesapi/api/games_api.dart';
import 'package:get/get.dart';

import '../models/games_model.dart';

class HomeController extends GetxController {
  List<GamesModel> _games = [];
  bool _loading = true;

  get loading => _loading;
  List<GamesModel> get games => _games;

  @override
  void onReady() {
    super.onReady();
    this.loadGmaes();
  }

  Future<void> loadGmaes() async {
    final data = await GamesApi.instance.getGames();
    this._games = data;
    _loading = false;
    update(['games']);
  }
}
