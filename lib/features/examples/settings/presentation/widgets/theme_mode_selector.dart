import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_starter_kit/core/theme/theme_provider.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Appearance', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment(
              value: ThemeMode.system,
              label: Text(AppStrings.themeSystem),
            ),
            ButtonSegment(
              value: ThemeMode.light,
              label: Text(AppStrings.themeLight),
            ),
            ButtonSegment(
              value: ThemeMode.dark,
              label: Text(AppStrings.themeDark),
            ),
          ],
          selected: {themeProvider.themeMode},
          onSelectionChanged: (selection) =>
              themeProvider.setTheme(selection.first),
        ),
      ],
    );
  }
}
