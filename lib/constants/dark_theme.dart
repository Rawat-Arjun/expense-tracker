import 'package:flutter/material.dart';

ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
var darkTheme = ThemeData().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.onPrimaryContainer,
    foregroundColor: kDarkColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer),
  ),
);
