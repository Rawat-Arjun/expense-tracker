import 'package:flutter/material.dart';

ColorScheme kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var brightTheme = ThemeData().copyWith(
  colorScheme: kcolorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kcolorScheme.onPrimaryContainer,
    foregroundColor: kcolorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kcolorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: kcolorScheme.primaryContainer),
  ),
);
