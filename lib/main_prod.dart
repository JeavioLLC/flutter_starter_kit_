import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'core/env/env.dart';
import 'main.dart';

/// Production config entry point.
/// Launch with `flutter run --flavor prod --target lib/main_prod.dart`.
/// 
/// Example features are registered in main.dart.
/// To disable example features, comment out their imports and registrations.
void main() {
  Logger.root.level = Level.OFF;
  Env.kDebugMode = false;

  runApp(const StarterKitBootstrap());
}