import 'package:go_router/go_router.dart';
import 'package:flutter_starter_kit/core/routing/feature_route.dart';
import 'package:flutter_starter_kit/core/routing/routes.dart';

import '../pages/dashboard_page.dart';
import '../pages/home_shell.dart';

/// Home feature routes.
/// Provides the dashboard route and shell route factory.
class HomeRoutes implements ShellRouteFactory {
  const HomeRoutes();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: Routes.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ];

  /// Creates a shell route with the provided branches.
  /// This allows the app router to combine routes from multiple features.
  @override
  StatefulShellRoute createShellRoute({
    required List<StatefulShellBranch> branches,
  }) {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeShell(navigationShell: navigationShell),
      branches: branches,
    );
  }

  @override
  String? get initialLocation => Routes.dashboard;
}
