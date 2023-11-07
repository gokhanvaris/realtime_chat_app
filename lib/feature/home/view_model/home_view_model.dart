// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/state/base/base_cubit.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';
import 'package:web_socket_channel/io.dart';

final class HomeViewModel extends BaseCubit<AppState> {
  HomeViewModel() : super(const AppState(isLoading: false));
  late final IOWebSocketChannel? channel;
  bool isWebSocketInitialized = false;
  List<String> messagesList = [];
  bool isLoading = false;

  /// Change loading state
  void changeLoading() {
    isLoading = state.isLoading;
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Socket connection
  Future<void> connectToSocket(String channelId) async {
    String personalChatId =
        '${AppEnvironmentValues.baseUrl.value}$channelId/${AppEnvironmentValues.apiKey.value}/';
    try {
      channel = IOWebSocketChannel.connect(
        personalChatId,
      );
      if (channel != null) {
        StreamSubscription<dynamic> subscription;
        subscription = channel!.stream.listen((message) {
          _handleMessage(message);
        });
      }

      isWebSocketInitialized = true;
      emit(state.copyWith(isLoading: true));
    } catch (e) {
      isWebSocketInitialized = false;
      emit(state.copyWith(isLoading: false));
    }
  }

  void _handleMessage(String message) {
    messagesList.add("From: $message");
    // emit(AppState(isLoading: false, messagesListState: messagesList));
    emit(state.copyWith(messagesListState: List<String>.from(messagesList)));
  }

  // Stream<dynamic>? getChannelStream() {
  //   if (isWebSocketInitialized) {
  //     emit(state.copyWith(message: []));
  //     return channel!.stream;
  //   }
  //   return null;
  // }

  void sendMessage(String message) {
    if (isWebSocketInitialized) {
      channel!.sink.add("You: $message");
      messagesList.add("You: $message");
      emit(state.copyWith(messagesListState: List<String>.from(messagesList)));
    }
  }
}
