import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseSnackbar {
  static void showMessage(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  static void showNoInternet(BuildContext context) {
    _showSnackBar(
      context,
      'No internet connection',
      backgroundColor: Colors.orange,
    );
  }

  static void _showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: GoogleFonts.montserrat(
              color: Colors.white,
            ),
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}
