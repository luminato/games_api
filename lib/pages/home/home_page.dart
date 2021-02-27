import 'package:flutter/material.dart';
import 'package:gamesapi/pages/home/home_widgets/home_new_games.dart';
import 'package:get/state_manager.dart';

import '../../controllers/home_controller.dart';
import '../../pages/home/home_widgets/home_list_games.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
           // backgroundColor: Colors.transparent,
            title: Text('G.A.M.E.S',
            style: TextStyle(
              fontFamily: 'PermanentMarker',
              fontSize: 22
            )),
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.black,
                  Colors.purple,
                  Colors.black,
                  Colors.black,
                  
            
                ]
              )

            ),
            child: Column(
              children: [
                HomeList(),
                FreeGames(),
              ],
            ),
          )
        );
      },
    );
  }
}
