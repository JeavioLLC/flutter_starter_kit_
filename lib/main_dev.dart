import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'core/env/env.dart';
import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --flavor dev --target lib/main_dev.dart`.
/// 
/// Example features are registered in main.dart.
/// To disable example features, comment out their imports and registrations.
void main() {
  Logger.root.level = Level.ALL;
  Env.kDebugMode = true;

  runApp(const StarterKitBootstrap());
}