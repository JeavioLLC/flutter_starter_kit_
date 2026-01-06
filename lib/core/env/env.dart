import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env', name: 'ProductionEnv')
@Envied(path: '.env_dev', name: 'DebugEnv')
final class Env {
  static bool kDebugMode = true;

  factory Env() => _instance;

  static final Env _instance = switch (kDebugMode) {
    true => _DebugEnv(),
    false => _ProductionEnv(),
  };

  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _instance.apiBaseUrl;
}
