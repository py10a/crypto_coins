import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ThemeData(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: Colors.yellow,
          surface: const Color.fromARGB(255, 243, 243, 243),
        ),
  ).colorScheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 227, 197, 29),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
