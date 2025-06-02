import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Modern color palette for Web3 app
const Color kToxicGreen = Color(0xFF39FF14);
const Color kDarkBackground = Color(0xFF121212);
const Color kDarkSurface = Color(0xFF1E1E1E);
const Color kErrorRed = Color(0xFFFF5555);

final ThemeData darkTheme = ThemeData(
  // Set Montserrat as the default font
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme:
      GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme).copyWith(
    // Light weight for body text
    bodyLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    bodyMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    bodySmall: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    // Bold weight for titles and headlines
    titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
  ),
  primaryTextTheme:
      GoogleFonts.montserratTextTheme(ThemeData.dark().primaryTextTheme),
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

// Light theme counterpart for the app
final ThemeData lightTheme = ThemeData(
  // Set Montserrat as the default font
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme:
      GoogleFonts.montserratTextTheme(ThemeData.light().textTheme).copyWith(
    bodyLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    bodyMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    bodySmall: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
    titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
  ),
  primaryTextTheme:
      GoogleFonts.montserratTextTheme(ThemeData.light().primaryTextTheme),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: kToxicGreen,
    secondary: kToxicGreen,
    surface: Color(0xFFF3F3F3), // Light surface color
    error: kErrorRed,
  ),
  scaffoldBackgroundColor: Colors.white,
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
    iconTheme: IconThemeData(color: kToxicGreen), // back button in green
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kToxicGreen,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kToxicGreen,
      foregroundColor: Colors.white,
      shape: const StadiumBorder(),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
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
    textColor: Colors.black,
    tileColor: Color(0xFFF3F3F3),
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
