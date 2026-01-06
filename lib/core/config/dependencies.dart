import 'package:flutter_starter_kit/core/env/env.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../shared/services/api/api_config.dart';
import '../theme/theme_provider.dart';

/// Registers core dependencies only.
/// Feature-specific dependencies should be registered via feature DI functions
/// called from main.dart.
List<SingleChildWidget> registerCoreDependencies() => [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ..._core,
];

// Core Providers
final _core = <SingleChildWidget>[
  Provider<ApiConfig>(create: (_) => ApiConfig(baseUrl: Env().apiBaseUrl)),
];
