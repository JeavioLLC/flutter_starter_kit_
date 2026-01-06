import 'package:go_router/go_router.dart';
import 'package:flutter_starter_kit/core/routing/feature_route.dart';
import 'package:flutter_starter_kit/core/routing/routes.dart';

import '../../domain/models/user.dart';
import '../pages/user_details_page.dart';
import '../pages/users_page.dart';

/// Users feature routes.
class UsersRoutes implements FeatureRoute {
  const UsersRoutes();

  @override
  List<RouteBase> get routes => [
    GoRoute(path: Routes.users, builder: (context, state) => const UsersPage()),
    GoRoute(
      path: Routes.userDetails,
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetailsPage(user: user);
      },
    ),
  ];

  @override
  String? get initialLocation => null;
}
