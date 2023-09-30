import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  cardTheme: const CardTheme(
    color: Color.fromRGBO(13, 58, 53, 1),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(173, 213, 202, 1),
    toolbarHeight: 64,
    // foregroundColor: Colors.
  ),
  colorScheme: ColorScheme.fromSeed(
    background: const Color.fromRGBO(173, 213, 202, 1),
    seedColor: const Color.fromRGBO(173, 213, 202, 1),
    secondary: const Color.fromRGBO(13, 58, 53, 1),
    primary: const Color.fromRGBO(0, 69, 56, 1),
    inverseSurface: const Color.fromRGBO(13, 58, 53, 1),
    onBackground: const Color.fromRGBO(13, 58, 53, 1),
  ),
);
