import 'package:go_router/go_router.dart';

/// Interface for feature-owned routing.
/// Each feature implements this to expose its routes.
abstract class FeatureRoute {
  /// The routes provided by this feature.
  List<RouteBase> get routes;

  /// Optional initial location override for this feature.
  /// If null, the app router will use its default initial location.
  String? get initialLocation => null;
}

/// Interface for features that provide shell route factories.
/// Features implementing this can create shell routes that combine
/// routes from multiple features.
abstract class ShellRouteFactory extends FeatureRoute {
  /// Creates a shell route with the provided branches.
  StatefulShellRoute createShellRoute({
    required List<StatefulShellBranch> branches,
  });
}
