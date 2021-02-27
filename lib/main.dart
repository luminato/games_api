import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        fontFamily: 'PermanentMarker',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline4: TextStyle(
            fontFamily: 'PermanentMarker',
            fontSize: 22,
            color: Colors.white
          ),
           headline5: TextStyle(
            fontFamily: 'PermanentMarker',
            fontSize: 13,
            //color: Colors.purple[600]
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

