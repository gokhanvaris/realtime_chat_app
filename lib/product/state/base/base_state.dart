import 'package:flutter/material.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/state/container/app_state_items.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // ProductNetworkManager get productNetworkManager =>
  //     ProductStateItems.productNetworkManager;

  HomeViewModel get homeViewModel => ProductStateItems.homeViewModel;
}
