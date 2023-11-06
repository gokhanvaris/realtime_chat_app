import 'package:gen/gen.dart';

/// Application environment
final class AppEnvironmentConfig {
  /// Setup application environment
  AppEnvironmentConfig.install({required ApplicationConfig config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironmentConfig.general() {
    _config = AppEnv();
  }

  static late final ApplicationConfig _config;
}

/// Get application environment env info
enum AppEnvironmentValues {
  /// baseUrl
  baseUrl,

  /// apiKey for requests
  apiKey;

  /// Get application environment value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentValues.baseUrl:
          return AppEnvironmentConfig._config.baseUrl;
        case AppEnvironmentValues.apiKey:
          return AppEnvironmentConfig._config.apiKey;
      }
    } catch (e) {
      throw Exception('Application is not initialized.');
    }
  }
}
