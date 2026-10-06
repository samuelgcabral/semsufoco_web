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
      surface: AppColors.background,
    ),
    textTheme: baseTextTheme,
  );
}

abstract final class AppText {
  static const double _baselineFactor = 0.364;

  static TextStyle style(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double letterSpacing = 0,
    double? lineHeight,
  }) {
    return GoogleFonts.inter(
      textStyle: const TextStyle(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: (lineHeight ?? size) / size,
    );
  }

  static double baseline(double size, [double? lineHeight]) =>
      (lineHeight ?? size) / 2 + _baselineFactor * size;
}
