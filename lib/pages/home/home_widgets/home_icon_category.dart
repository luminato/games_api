import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:get/state_manager.dart';

class IconCategory extends StatelessWidget {
  final HomeController homeController = HomeController();

  Widget iconImage({String asset, Color cor, String category}) {
    return Container(
      width: 30,
      height: 25,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
         ),
      child: Image.asset(asset, fit: BoxFit.contain, color: cor),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'filter',
      builder: (_) {
        return Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: homeController.data.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  labelPadding: EdgeInsets.all(0),
                  showCheckmark: false,
                  elevation: 5,
                  label: iconImage(asset: _.data[index]),
                  onSelected: (bool value) => _.onselected(value, index),
                  selected: _.selected.contains(index),
                  selectedColor: Colors.grey,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.deepPurple,
                  ),
              ),
                ),
            );
      },
    );
  }
}
