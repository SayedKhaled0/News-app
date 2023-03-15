import 'package:flutter/material.dart';


class MyThemeData {
  static const Color colorgreen = Color.fromRGBO(97, 231, 87, 1.0);
  static const Color primeycolor = Color.fromRGBO(93, 156, 236, 1.0);
  static const Color darkprimery = Color.fromRGBO(6, 14, 30, 1.0);
  static const Color back = Color.fromRGBO(223, 236, 219, 1.0);
  static const Color colorblack = Color.fromRGBO(54, 54, 54, 1.0);
  static ThemeData light = ThemeData(
      primaryColor: primeycolor,
      scaffoldBackgroundColor: back,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primeycolor,
          onPrimary: Colors.white,
          secondary: colorgreen,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: back,
          onBackground: primeycolor,
          surface: Colors.grey,
          onSurface: Colors.black),
      appBarTheme: AppBarTheme(
          backgroundColor: primeycolor,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primeycolor),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorgreen),
      ),
      floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: primeycolor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primeycolor,
      ));

  static ThemeData Dark = ThemeData(
      primaryColor: darkprimery,
      scaffoldBackgroundColor: darkprimery,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkprimery,
          onPrimary: Colors.white,
          secondary: colorgreen,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: back,
          onBackground: darkprimery,
          surface: Colors.grey,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: primeycolor,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        subtitle2: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: colorgreen),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primeycolor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primeycolor,
      ));
}
