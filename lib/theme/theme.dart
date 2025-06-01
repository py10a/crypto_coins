import 'package:flutter/material.dart';

// Modern color palette for Web3 app
const Color kToxicGreen = Color(0xFF39FF14);
const Color kDarkBackground = Color(0xFF121212);
const Color kDarkSurface = Color(0xFF1E1E1E);
const Color kErrorRed = Color(0xFFFF5555);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: kToxicGreen,
    secondary: kToxicGreen,
    // background is deprecated; using surface roles
    surface: kDarkSurface,
    error: kErrorRed,
  ),
  scaffoldBackgroundColor: kDarkBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: kToxicGreen,
    foregroundColor: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: kToxicGreen),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kToxicGreen,
    foregroundColor: kDarkBackground,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kToxicGreen,
      foregroundColor: kDarkBackground,
      shape: const StadiumBorder(),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kDarkSurface,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: kToxicGreen),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kToxicGreen),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: kToxicGreen),
  listTileTheme: ListTileThemeData(
    iconColor: kToxicGreen,
    textColor: Colors.white,
    tileColor: kDarkSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  // Use iOS-style page transitions (Cupertino) for all platforms
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
