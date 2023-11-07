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
            BlocBuilder<HomeViewModel, AppState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      if (!homeViewModel.isWebSocketInitialized) {
                        homeViewModel.connectToSocket("1");
                        homeViewModel.changeLoading();
                      }
                    },
                    child: Text(homeViewModelIsLoading == true
                        ? 'connected'
                        : 'Room 1'));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (homeViewModel.isWebSocketInitialized) {
                    homeViewModel.sendMessage('deneme');
                    // messages.add("deneme");
                  }
                },
                child: const Text('Testing')),

            BlocBuilder<HomeViewModel, AppState>(
              builder: (context, state) {
                if (state.messagesListState != null) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.messagesListState!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.messagesListState![index]),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: SizedBox(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
