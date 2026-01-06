import 'package:flutter/material.dart';
import '../colors.dart';

extension ThemeContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);

  AppColors get appColors => AppColors();
}
