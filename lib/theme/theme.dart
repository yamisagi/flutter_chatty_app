import 'package:flutter/material.dart';

class ProductTheme {
  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
  );
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
  );
}
