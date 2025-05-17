import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFFFE7743); // Blue color
  static const Color primaryOrange = Color(0xFFFE7743);
  static const Color secondaryYellow = Color(0xFFFFDF88);
  static const Color darkBlue = Color(0xFF273F4F);

  // Background Colors
  static const Color lightGray = Color(0xFFEFEEEA);
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
