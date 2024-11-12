import 'package:basic_structure/src/themes/dark/dark_theme.dart';
import 'package:basic_structure/src/themes/light/light_theme.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      inputDecorationTheme: inputDecorationTheme,
      // appBarTheme: appbarThemeLight,
      textTheme: textThemeLight,
      colorScheme: colorSeedLight,
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: appbarThemeDark,
      textTheme: textThemeDark,
    );
