import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF2196F3); // Blue color
  static const Color primaryOrange = Color(0xFFFF5722);
  static const Color secondaryYellow = Color(0xFFFFB22C);
  static const Color darkBlue = Color(0xFF1A237E);

  // Background Colors
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color veryLightGray = Color(0xFFEEEEEE);

  // Theme Data
  static ThemeData get theme => ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryYellow,
      background: veryLightGray,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
