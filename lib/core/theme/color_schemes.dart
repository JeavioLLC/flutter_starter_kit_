import 'package:flutter/material.dart';
import 'colors.dart';

/// Material 3 color schemes using AppColors as the base.
class AppColorSchemes {
  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.textPrimaryLight,

    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryLight,
    onSecondaryContainer: AppColors.textPrimaryLight,

    tertiary: AppColors.success,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.successContainer,
    onTertiaryContainer: AppColors.textPrimaryLight,

    error: AppColors.error,
    onError: Colors.white,
    errorContainer: AppColors.errorContainerLight,
    onErrorContainer: AppColors.textPrimaryLight,

    // MAIN SURFACES
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,

    // MATERIAL 3 SURFACE CONTAINERS
    surfaceContainerLowest: AppColors.surfaceContainerLowestLight,
    surfaceContainerLow: AppColors.surfaceContainerLowLight,
    surfaceContainer: AppColors.surfaceContainerLight,
    surfaceContainerHigh: AppColors.surfaceContainerHighLight,
    surfaceContainerHighest: AppColors.surfaceContainerHighestLight,

    // OUTLINE
    outline: AppColors.outlineLight,
    outlineVariant: AppColors.outlineVariantLight,

    shadow: Colors.black12,
    scrim: Colors.black26,

    inverseSurface: AppColors.surfaceDark,
    onInverseSurface: AppColors.textPrimaryDark,
    inversePrimary: AppColors.primaryDark,

    // Used for elevated surfaces
    surfaceTint: AppColors.primary,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primaryLight,
    onPrimary: Colors.black,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.textPrimaryDark,

    secondary: AppColors.secondaryLight,
    onSecondary: Colors.black,
    secondaryContainer: AppColors.secondaryDark,
    onSecondaryContainer: AppColors.textPrimaryDark,

    tertiary: AppColors.success,
    onTertiary: Colors.black,
    tertiaryContainer: AppColors.successContainer,
    onTertiaryContainer: AppColors.textPrimaryDark,

    error: AppColors.error,
    onError: Colors.black,
    errorContainer: AppColors.errorContainerDark,
    onErrorContainer: AppColors.textPrimaryDark,

    // MAIN SURFACE
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,

    // MATERIAL 3 SURFACE CONTAINERS
    surfaceContainerLowest: AppColors.surfaceContainerLowestDark,
    surfaceContainerLow: AppColors.surfaceContainerLowDark,
    surfaceContainer: AppColors.surfaceContainerDark,
    surfaceContainerHigh: AppColors.surfaceContainerHighDark,
    surfaceContainerHighest: AppColors.surfaceContainerHighestDark,

    // OUTLINE
    outline: AppColors.outlineDark,
    outlineVariant: AppColors.outlineVariantDark,

    shadow: Colors.black54,
    scrim: Colors.black87,

    inverseSurface: AppColors.surfaceLight,
    onInverseSurface: AppColors.textPrimaryLight,
    inversePrimary: AppColors.primaryLight,

    surfaceTint: AppColors.primaryLight,
  );
}
