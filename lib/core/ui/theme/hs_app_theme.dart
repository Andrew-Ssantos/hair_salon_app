import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

sealed class HsAppTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: ColorsConstants.ligthPurple),
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsConstants.ligthPurple,
      selectedItemColor: ColorsConstants.ligthGreen,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: _defaultInputBorder,
      labelStyle: const TextStyle(color: ColorsConstants.grey),
      focusedBorder: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.red),
      ),
    ),
  );
}
