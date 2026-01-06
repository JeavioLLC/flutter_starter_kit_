import 'package:flutter/material.dart';
import '../app_spacing.dart';

extension SpacingExt on BuildContext {
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
}
