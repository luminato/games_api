import 'package:flutter/material.dart';
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
          body: HomeList()
        );
      },
    );
  }
}
