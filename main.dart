import 'package:flutter/material.dart';
import 'package:intership_project/constants.dart';
import 'package:intership_project/homescreen.dart';
// import 'package:intership_project\lib\homescreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'divyang.com',
      theme: ThemeData(
        // // scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        // sliderTheme: SliderThemeData(
        //   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 1)
        // ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: ttextColor ),
      ),
      home: homescreen(),
    );
  }
}