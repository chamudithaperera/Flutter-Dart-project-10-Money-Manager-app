import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFFFF6F00); // Vivid orange
  static const Color primaryOrange = Color(
    0xFFFF8F00,
  ); // Slightly lighter orange
  static const Color secondaryYellow = Color(
    0xFFFFE082,
  ); // Soft yellow for highlights
  static const Color darkBlue = Color(
    0xFF3E2723,
  ); // Deep brownish for text or dark accents

  // Background Colors
  static const Color lightGray = Color(0xFFF5F5F5); // Light neutral background
  static const Color darkGray = Color(0xFFFBE9E7); // Warm gray with orange tone
  static const Color veryLightGray = Color(
    0xFFFAFAFA,
  ); // Very subtle background for sections

  // Theme Data
  static ThemeData get theme => ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryYellow,
      onSecondary: Colors.black,
      error: Color(0xFFD32F2F), // Deep red for errors
      onError: Colors.white,
      background: veryLightGray,
      onBackground: darkBlue,
      surface: Colors.white,
      onSurface: darkBlue,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Color(0xFFBDBDBD),
    iconTheme: const IconThemeData(color: darkBlue),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkBlue),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );
}
