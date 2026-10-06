import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semsufoco/theme/app_colors.dart';

ThemeData getAppTheme() {
  final baseTextTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
      .apply(
        bodyColor: AppColors.textSecondary,
        displayColor: AppColors.textPrimary,
      );

  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mint,
      brightness: Brightness.dark,
    ),
    textTheme: baseTextTheme,
  );
}
