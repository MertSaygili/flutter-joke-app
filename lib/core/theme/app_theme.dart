import 'package:flutter/material.dart';
import 'package:joke_flutter_app/core/gen/fonts.gen.dart';
import 'package:joke_flutter_app/core/theme/app_colors.dart';

@immutable
final class AppTheme {
  const AppTheme._();

  static get theme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.instance.primary,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontFamily: FontFamily.bRFirmaFontFamily,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}
