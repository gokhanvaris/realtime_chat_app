import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/home/view/mixin/home_view_mixin.dart';
import 'package:realtime_chat_app/feature/home/view/widgets/build_home_logo.dart';
import 'package:realtime_chat_app/feature/home/view/widgets/build_room_button.dart';
import 'package:realtime_chat_app/feature/home/view/widgets/username_textfield.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BuildHomeLogo(),
              BuildUsernameTextField(
                homeViewModel: homeViewModel,
                usernameController: usernameController,
              ),
              BuildRoomButton(
                  roomType: RoomType.ROOM_ONE,
                  homeViewModel: homeViewModel,
                  usernameController: usernameController,
                  homeViewModelIsLoading: homeViewModelIsLoading),
              BuildRoomButton(
                  roomType: RoomType.ROOM_TWO,
                  homeViewModel: homeViewModel,
                  usernameController: usernameController,
                  homeViewModelIsLoading: homeViewModelIsLoading),
            ],
          ),
        ),
      ),
    );
  }
}
