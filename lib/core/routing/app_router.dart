import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'feature_route.dart';

/// Creates the app router by aggregating routes from feature route instances.
///
/// Features are provided via the [featureRoutes] parameter, allowing
/// the app to opt into specific features at the composition point.
GoRouter appRouter({required List<FeatureRoute> featureRoutes}) {
  if (featureRoutes.isEmpty) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('No features registered')),
          ),
        ),
      ],
    );
  }

  // Find initial location from feature routes
  final initialLocation = featureRoutes
      .map((r) => r.initialLocation)
      .whereType<String>()
      .firstOrNull;

  // Check if we have a shell route factory (from home feature)
  ShellRouteFactory? shellRouteFactory;
  final List<StatefulShellBranch> shellBranches = [];
  final List<RouteBase> standaloneRoutes = [];

  for (final featureRoute in featureRoutes) {
    // Check if this is a shell route factory
    if (featureRoute is ShellRouteFactory) {
      shellRouteFactory = featureRoute;
      // Add this feature's routes as the first branch
      final homeRoutes = featureRoute.routes.whereType<GoRoute>().toList();
      if (homeRoutes.isNotEmpty) {
        shellBranches.add(StatefulShellBranch(routes: homeRoutes));
      }
      continue;
    }

    // Collect routes for shell branches or standalone routes
    final featureRoutesList = featureRoute.routes.whereType<GoRoute>().toList();
    if (shellRouteFactory != null && featureRoutesList.isNotEmpty) {
      // Add to shell branches
      shellBranches.add(StatefulShellBranch(routes: featureRoutesList));
    } else {
      // Add as standalone routes
      standaloneRoutes.addAll(featureRoute.routes);
    }
  }

  // Build final routes list
  final routes = <RouteBase>[];

  // Add shell route first if we have one
  if (shellRouteFactory != null && shellBranches.isNotEmpty) {
    routes.add(shellRouteFactory.createShellRoute(branches: shellBranches));
  }

  // Add standalone routes
  routes.addAll(standaloneRoutes);

  return GoRouter(initialLocation: initialLocation ?? '/', routes: routes);
}
