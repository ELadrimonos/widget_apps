import 'package:flutter/material.dart';

const colorList = [
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater or equal than 0'),
      assert(selectedColor < colorList.length, 'Selected color must within the range of 0 to ${colorList.length - 1}');


  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      )
    );
  }
}