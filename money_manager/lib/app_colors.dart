import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryOrange = Color(0xFFFA812F);
  static const Color secondaryYellow = Color(0xFFFFB22C);
  static const Color darkBlue = Color(0xFF2A4759);

  // Background Colors
  static const Color lightGray = Color(0xFFDDDDDD);
  static const Color veryLightGray = Color(0xFFEEEEEE);

  // Theme Data
  static ThemeData get theme => ThemeData(
    primaryColor: primaryOrange,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryOrange,
      primary: primaryOrange,
      secondary: secondaryYellow,
      background: veryLightGray,
    ),
    scaffoldBackgroundColor: veryLightGray,
  );
}
