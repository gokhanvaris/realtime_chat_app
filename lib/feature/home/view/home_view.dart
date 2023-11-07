import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/home/view/mixin/home_view_mixin.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(AppEnvironmentValues.baseUrl.value)),
            //
            BlocListener<HomeViewModel, AppState>(
              listener: (context, state) {
                if (state.isLoading) {
                  print('connected');
                } else {
                  print('none');
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    homeViewModel.connectToSocket("1");
                  },
                  child: const Text('connect')),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Testing'))
          ],
        ),
      ),
    );
  }
}
