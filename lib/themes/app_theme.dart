import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      background: Colors.black,
      brightness: Brightness.dark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: const ButtonThemeData(
      shape: CircleBorder(
        side: BorderSide(color: Color.fromARGB(255, 27, 27, 27)),
      ),
      buttonColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(5),
      helperMaxLines: 0,
    ),
  );
}
