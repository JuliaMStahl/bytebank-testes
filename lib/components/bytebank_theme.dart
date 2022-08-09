import 'package:flutter/material.dart';

final ThemeData BytebankTheme = ThemeData(
  primaryColor: Colors.green[900],
  appBarTheme: AppBarTheme(color: Colors.green[900]),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent[700],
    textTheme: ButtonTextTheme.primary,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
);