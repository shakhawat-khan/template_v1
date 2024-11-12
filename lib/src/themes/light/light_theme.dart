import 'package:flutter/material.dart';

const inputDecorationTheme = InputDecorationTheme(
  constraints: BoxConstraints(),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        14,
      ),
    ),
  ),
);

// const appbarThemeLight = AppBarTheme(
//   backgroundColor: Colors.blue,
//   foregroundColor: Colors.white,
// );

const textThemeLight = TextTheme(
  bodyLarge: TextStyle(color: Colors.black87),
  bodyMedium: TextStyle(color: Colors.black87),
);

final colorSeedLight = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
);
