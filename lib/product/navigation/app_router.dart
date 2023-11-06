import 'package:auto_route/auto_route.dart';
import 'package:realtime_chat_app/feature/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Project router information class.
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
