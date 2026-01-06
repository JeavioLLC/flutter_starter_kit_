import 'package:flutter/material.dart';
import 'app_spacing.dart';
import 'color_schemes.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.light,
    fontFamily: AppTypography.fontFamily,
    textTheme: AppTypography.textTheme.apply(
      fontFamily: AppTypography.fontFamily,
    ),
    extensions: const [AppSpacing()],
    appBarTheme: const AppBarTheme(centerTitle: true),
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.dark,
    fontFamily: AppTypography.fontFamily,
    textTheme: AppTypography.textTheme.apply(
      fontFamily: AppTypography.fontFamily,
    ),
    extensions: const [AppSpacing()],
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
