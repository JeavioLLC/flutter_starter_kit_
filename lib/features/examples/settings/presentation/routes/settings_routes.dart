import 'package:go_router/go_router.dart';
import 'package:flutter_starter_kit/core/routing/feature_route.dart';
import 'package:flutter_starter_kit/core/routing/routes.dart';

import '../pages/settings_page.dart';

/// Settings feature routes.
class SettingsRoutes implements FeatureRoute {
  const SettingsRoutes();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: Routes.settings,
      builder: (context, state) => const SettingsPage(),
    ),
  ];

  @override
  String? get initialLocation => null;
}
