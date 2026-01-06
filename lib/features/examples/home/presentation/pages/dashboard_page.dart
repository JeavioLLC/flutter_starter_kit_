import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/theme/extensions/colors_ext.dart';
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
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Text(
                AppStrings.dashboardWelcome,
                style: context.typography.headlineSmall?.copyWith(
                  color: context.colorScheme.primary
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 12),
              const Text(
                AppStrings.dashboardDescription,
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
