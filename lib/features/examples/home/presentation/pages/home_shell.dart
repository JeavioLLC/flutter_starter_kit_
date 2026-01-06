import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';

import '../widgets/app_navigation_bar.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppNavigationBar(
        currentIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: AppStrings.navDashboard,
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            label: AppStrings.navUsers,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: AppStrings.navSettings,
          ),
        ],
        onTap: _onDestinationSelected,
      ),
    );
  }
}
