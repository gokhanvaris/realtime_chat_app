import 'package:flutter/material.dart';
import 'package:realtime_chat_app/feature/chat/view/chat_view.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

mixin ChatViewMixin on State<ChatView> {
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  bool get homeViewModelIsLoading => _homeViewModel.isLoading;
  RoomType? get roomType => _homeViewModel.roomType;
  @override
  void initState() {
    _homeViewModel = HomeViewModel();
    _homeViewModel.connectToSocket(widget.roomType.value, widget.roomType);
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
