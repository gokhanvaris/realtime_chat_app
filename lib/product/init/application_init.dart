import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/state/container/app_container.dart';

@immutable

/// This class is used to initialize the application
final class ApplicationInitialize {
  ///  initialize the app
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (details) {
      /// custom service logger
      Logger().e(details.exceptionAsString());
    };
    _installApplicationEnv();
  }

  void _installApplicationEnv() {
    AppEnvironmentConfig.install(config: AppEnv());
    // AppContainer.
    AppContainer.setup();
  }
}
