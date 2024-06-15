import 'package:flutter/material.dart';

class AppColors {
  //  default colors
  static Color primaryColor = Colors.blueAccent;
  static Color secondaryColor = Colors.pink;
  static const Color editTextColor = Colors.white;
  static const Color hintTextColor = Colors.white38;
}

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.secondaryColor,
  ),
  scaffoldBackgroundColor: const Color(0xffDAD3C8),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
  ),
  cardTheme: const CardTheme(color: Colors.white, elevation: 8),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  listTileTheme: const ListTileThemeData(tileColor: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  ),
);
