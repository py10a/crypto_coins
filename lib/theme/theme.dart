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
    foregroundColor: Colors.black87,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(32),
      ),
    ),
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 227, 197, 29),
    foregroundColor: Colors.black87,
  ),
);
