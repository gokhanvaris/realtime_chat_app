import 'package:flutter/material.dart';
import 'package:realtime_chat_app/feature/home/view/home_view.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> {
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  bool get homeViewModelIsLoading => _homeViewModel.isLoading;
  @override
  void initState() {
    _homeViewModel = HomeViewModel();

    // if (_homeViewModel.isWebSocketInitialized) {
    //   _homeViewModel.channel!.stream.listen((event) {
    //     _homeViewModel.messagesList.add(event);
    //   });
    // }
    super.initState();
  }

  @override
  void dispose() {
    if (_homeViewModel.isWebSocketInitialized) {
      _homeViewModel.channel!.sink.close();
    }
    super.dispose();
  }
}
