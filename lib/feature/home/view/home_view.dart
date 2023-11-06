import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app/product/init/config/app_config.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppEnvironmentValues.baseUrl.value)),
    );
  }
}
