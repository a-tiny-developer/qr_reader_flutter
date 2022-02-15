import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primary,
    ),
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
