import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/language/locale_keys.g.dart';
import 'package:realtime_chat_app/product/navigation/app_router.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

class BuildRoomButton extends StatefulWidget {
  const BuildRoomButton({
    super.key,
    required this.homeViewModel,
    required this.homeViewModelIsLoading,
    required this.roomType,
    required this.usernameController,
  });

  final HomeViewModel homeViewModel;
  final bool homeViewModelIsLoading;
  final RoomType roomType;
  final TextEditingController usernameController;

  @override
  State<BuildRoomButton> createState() => _BuildRoomButtonState();
}

class _BuildRoomButtonState extends State<BuildRoomButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.homeViewModel,
      child: BlocBuilder<HomeViewModel, AppState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              widget.homeViewModel.roomType = widget.roomType;
              if (!widget.homeViewModel.isWebSocketInitialized) {
                widget.homeViewModel.changeLoading();
              }

              context.router.push(ChatRoute(
                  id: widget.roomType.value,
                  roomType: widget.roomType,
                  userName: widget.usernameController.text));
            },
            child: Text(
              '${LocaleKeys.room} ${widget.roomType.value}'.tr(),
            ),
          );
        },
      ),
    );
  }
}
