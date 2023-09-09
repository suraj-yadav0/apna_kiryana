import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));
