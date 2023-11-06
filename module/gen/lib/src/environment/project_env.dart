import 'package:envied/envied.dart';
import 'package:gen/src/environment/application_config.dart';

part 'project_env.g.dart';

@Envied(path: 'assets/env/.app.env', obfuscate: true)

/// App environment variables
final class AppEnv implements ApplicationConfig {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _AppEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _AppEnv._apiKey;

  @override
  String get apiKey => _apiKey;

  @override
  String get baseUrl => _baseUrl;
}
