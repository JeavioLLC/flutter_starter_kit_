import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/theme/extensions/spacing_ext.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';

import '../widgets/theme_mode_selector.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navSettings)),
      body: Padding(
        padding: .all(context.spacing.large),
        child: const ThemeModeSelector(),
      ),
    );
  }
}
