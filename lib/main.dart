import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app/product/init/application_init.dart';
import 'package:realtime_chat_app/product/init/language/application_localization.dart';
import 'package:realtime_chat_app/product/navigation/app_router.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
  await ApplicationInitialize().start();
  runApp(AppLocalization(child: const _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      builder: AppResponsive.build,
      themeMode: ThemeMode.light,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
