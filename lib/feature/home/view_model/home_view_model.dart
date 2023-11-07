// ignore_for_file: unused_local_variable

import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/state/base/base_cubit.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';
import 'package:web_socket_channel/io.dart';

final class HomeViewModel extends BaseCubit<AppState> {
  HomeViewModel() : super(const AppState(isLoading: false));

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Socket connection
  Future<void> connectToSocket(String channelId) async {
    late final IOWebSocketChannel channel;
    String personalChatId =
        '${AppEnvironmentValues.baseUrl.value}/$channelId/${AppEnvironmentValues.apiKey.value}';
    channel = IOWebSocketChannel.connect(
      personalChatId,
    );
    emit(state.copyWith(isLoading: true));
  }
}
