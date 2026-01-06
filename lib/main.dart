import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/utils/app_strings.dart';
import 'package:provider/provider.dart';
import 'core/config/dependencies.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
// Example features - opt in explicitly
import 'features/examples/home/presentation/di/home_di.dart';
import 'features/examples/home/presentation/routes/home_routes.dart';
import 'features/examples/settings/presentation/di/settings_di.dart';
import 'features/examples/settings/presentation/routes/settings_routes.dart';
import 'features/examples/users/data/di/users_di.dart';
import 'features/examples/users/presentation/routes/users_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StarterKitBootstrap());
}

class StarterKitBootstrap extends StatelessWidget {
  const StarterKitBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    // Compose core and feature dependencies
    final providers = [
      ...registerCoreDependencies(),
      // Opt into example features
      ...registerHomeFeature(),
      ...registerUsersFeature(),
      ...registerSettingsFeature(),
    ];

    return MultiProvider(providers: providers, child: const StarterKitApp());
  }
}

class StarterKitApp extends StatefulWidget {
  const StarterKitApp({super.key});

  @override
  State<StarterKitApp> createState() => _StarterKitAppState();
}

class _StarterKitAppState extends State<StarterKitApp> {
  late final _router = appRouter(
    // Aggregate routes from example features
    featureRoutes: const [
      HomeRoutes(),
      UsersRoutes(),
      SettingsRoutes(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: themeProvider.themeMode,
          routerConfig: _router,
        );
      },
    );
  }
}
