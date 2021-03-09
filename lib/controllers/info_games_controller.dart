import 'package:gamesapi/models/games_model.dart';
import 'package:gamesapi/models/genres_name.dart';
import 'package:gamesapi/models/new_games_models.dart';
import 'package:gamesapi/models/platforms_model.dart';
import 'package:gamesapi/models/screens_model.dart';

import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class InfoGamesController extends GetxController {
  GamesModel _game;
  GamesModel get games => _game;

  NewGamesModel _newGames;
  NewGamesModel get newGames => _newGames;

  List<ScreensModel> _screens = [];
  get screens => _screens;

  List<GenresModel> _genres = [];
  get genres => _genres;

  List<PlatformsModel> _platforms = [];
  get platforms => _platforms;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._game = Get.arguments[0] as GamesModel;
    this._newGames = Get.arguments[1] as NewGamesModel;
    this.loadScreens();
    this.loadGenres();
    this.loadPlatform();
  }

  int len;
  var banner;

  Future<void> loadScreens() async {
    if (_game != null) {
      List<ScreensModel> _dados =
          (_game.screens).map((e) => ScreensModel.fromJson(e)).toList();
      _screens = _dados;
      banner = _screens[0];
      len = _screens.length;
    } else {
      List<ScreensModel> _dados =
          (_newGames.screens).map((e) => ScreensModel.fromJson(e)).toList();
      _screens = _dados;
      banner = _screens[0];
      len = _screens.length;
    }
    update([
      'screens',
    ]);
  }

  int leng;

  Future<void> loadGenres() async {
    if (_game != null) {
      List<GenresModel> _dados =
          (_game.genres).map((e) => GenresModel.fromJson(e)).toList();
      _genres = _dados;
      leng = _genres.length;
    } else {
      List<GenresModel> _dados =
          (_newGames.genres).map((e) => GenresModel.fromJson(e)).toList();
      _genres = _dados;
      leng = _genres.length;
    }
    update([
      'specfic',
    ]);
  }

  int lenP;

  Future<void> loadPlatform() async {
    if (_game != null) {
      List<PlatformsModel> _dados =
          (_game.platforms).map((e) => PlatformsModel.fromJson(e)).toList();
      _platforms = _dados;
      lenP = _platforms.length;
    } else {
      List<PlatformsModel> _dados =
          (_newGames.platforms).map((e) => PlatformsModel.fromJson(e)).toList();
      _platforms = _dados;
      lenP = _platforms.length;
    }
    update([
      'platforms',
    ]);
  }

  convertData(int mili) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(mili * 1000);
    return date;
  }
}
