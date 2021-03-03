import 'package:gamesapi/api/games_api.dart';
import 'package:gamesapi/api/games_new_api.dart';
import 'package:gamesapi/api/noticias_api.dart';
import 'package:gamesapi/models/new_games_models.dart';
import 'package:gamesapi/models/noticias_model.dart';
import 'package:gamesapi/pages/info_games/info_games.dart';
import 'package:get/get.dart';

import '../models/games_model.dart';

class HomeController extends GetxController {
  List<GamesModel> _games = [];
  List<NewGamesModel> _newGames = [];
  List<YoutubeModel> _videos = [];
  bool _loading = true;
  bool _newLoading = true;

  get loading => _loading;
  get newLoading => _newLoading;

  List<GamesModel> get games => _games;
  List<NewGamesModel> get newGames => _newGames;
  List get videos => _videos;

  @override
  void onReady() {
    super.onReady();
    this.loadGames();
    this.loadNewGames();
    this.getVideos();
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

  Future<void> getVideos() async {
    final data = await YoutubeApi.instance.getVideos();
    this._videos = data;
    update(['youtube']);
  }

  var data = [
    'assets/images/linux.png',
    'assets/images/mac.png',
    'assets/images/windows.png',
    'assets/images/ps.png',
    'assets/images/xbox.ico',
    'assets/images/ios.png',
    'assets/images/android.ico',
  ];

  List<int> platform = [3, 14, 6, 48, 49, 39, 34];

  //3, 14, 6, 48, 49, 39, 34

  var selected = [];
  void onselected(bool value, int index) {
    print(data);
    if (selected.contains(index)) {
      selected.remove(index);
    } else {
      selected.add(index);
      platform.remove(index);
    }
    update(['filter']);
  }

  showInfoGames(GamesModel games) {
    Get.to(InfoGames(), arguments: games);
  }
}
