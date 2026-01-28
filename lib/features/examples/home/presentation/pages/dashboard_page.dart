import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/theme/extensions/colors_ext.dart';
import 'package:flutter_starter_kit/core/theme/extensions/spacing_ext.dart';
import 'package:flutter_starter_kit/core/theme/extensions/typography_ext.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navDashboard)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.base),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Text(
                  "Welcome to the Starter Kit",
                  style: context.typography.headlineSmall?.copyWith(
                    color: context.colorScheme.primary
                  ),
                  textAlign: .center,
                ),
                const SizedBox(height: 12),
                Text(
                  "Use this dashboard to stitch together new feature modules, register providers, and wire routing.",
                  style: context.typography.bodyMedium,
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
