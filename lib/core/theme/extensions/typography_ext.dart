import 'package:flutter/material.dart';

extension ThemeTypography on BuildContext {
  TextTheme get typography => Theme.of(this).textTheme;
}

