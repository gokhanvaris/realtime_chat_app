import 'package:flutter/material.dart';
import 'package:realtime_chat_app/feature/home/view/home_view.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> {
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  @override
  void initState() {
    _homeViewModel = HomeViewModel();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
