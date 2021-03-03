import 'package:gamesapi/models/games_model.dart';

import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class InfoGamesController extends GetxController {
  GamesModel _game;
  GamesModel get games => _game;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._game = Get.arguments as GamesModel;
  }


  
}
