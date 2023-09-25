import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      textStyle: const TextStyle(color: Colors.red),
      side: const BorderSide(color: Colors.red),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    
   // disabledBackgroundColor:outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(fontSize: 18),
    ),
   // disabledBackgroundColor:Colors.grey,
  ),
  primarySwatch: Colors.red,
  canvasColor: Colors.red,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));
