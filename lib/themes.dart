import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final List<ThemeData> themesList = [
    lightTheme,
    darkTheme,
    colorTheme,
  ];

  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    dividerColor: Colors.black12,
    primaryTextTheme: TextTheme(
      headline3: TextStyle(color: Colors.white, fontSize: 28),
      headline6: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    dividerColor: Colors.white54,
    primaryTextTheme: TextTheme(
      headline3: TextStyle(color: Colors.black, fontSize: 28),
      headline6: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );

  static final colorTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.purple,
    accentColor: Colors.amber,
    brightness: Brightness.light,
    backgroundColor: Colors.black12,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.purple,
    ),
    dividerColor: Colors.amber,
    primaryTextTheme: TextTheme(
      headline3: TextStyle(color: Colors.amber, fontSize: 28),
      headline6: TextStyle(color: Colors.purple, fontSize: 20),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.purple,
      centerTitle: true,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}
