// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/state/base/base_cubit.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';
import 'package:web_socket_channel/io.dart';

final class HomeViewModel extends BaseCubit<AppState> {
  HomeViewModel() : super(const AppState(isLoading: false));
  late final IOWebSocketChannel? channel;
  bool isWebSocketInitialized = false;
  List<String> messagesListForRoom1 = [];
  List<String> messagesListForRoom2 = [];

  bool isLoading = false;
  RoomType? roomType;

  /// Change loading state
  void changeLoading() {
    isLoading = state.isLoading;
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Socket connection
  Future<void> connectToSocket(String channelId, RoomType roomType) async {
    String personalChatId =
        '${AppEnvironmentValues.baseUrl.value}$channelId/${AppEnvironmentValues.apiKey.value}/';
    try {
      channel = IOWebSocketChannel.connect(
        personalChatId,
      );
      if (channel != null) {
        StreamSubscription<dynamic> subscription;
        subscription = channel!.stream.listen((message) {
          _handleMessage(message, roomType);
        });
      }

      isWebSocketInitialized = true;
      emit(state.copyWith(isLoading: true));
    } catch (e) {
      isWebSocketInitialized = false;
      emit(state.copyWith(isLoading: false));
    }
  }

  /// listen socket method
  void _handleMessage(String message, RoomType roomType) {
    if (roomType == RoomType.ROOM_ONE) {
      messagesListForRoom1.add("From: $message");
    } else {
      messagesListForRoom2.add("From: $message");
    }

    emit(state.copyWith(
        messagesListState: roomType == RoomType.ROOM_ONE
            ? List<String>.from(messagesListForRoom1)
            : List<String>.from(messagesListForRoom2)));
  }

  /// send message method
  void sendMessage(
      {String? message = "",
      required String username,
      required RoomType roomType}) {
    if (isWebSocketInitialized) {
      channel!.sink.add("$username: $message");
      if (roomType == RoomType.ROOM_ONE) {
        messagesListForRoom1.add("$username: $message");
      } else {
        messagesListForRoom2.add("$username: $message");
      }
      emit(state.copyWith(
          messagesListState: roomType == RoomType.ROOM_ONE
              ? List<String>.from(messagesListForRoom1)
              : List<String>.from(messagesListForRoom2)));
    }
  }
}
