import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app/feature/chat/view/chat_view.dart';
import 'package:realtime_chat_app/feature/home/view/home_view.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Project router information class.
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ChatRoute.page),
      ];
}
