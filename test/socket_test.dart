import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/config/app_config.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

void main() {
  late final HomeViewModel homeViewModel;
  setUp(() {
    AppEnvironmentConfig.install(config: AppEnv());
    homeViewModel = HomeViewModel();
  });
  test('connect to socket', () async {
    homeViewModel.connectToSocket("1", RoomType.ROOM_ONE);

    expect(homeViewModel.isWebSocketInitialized, true);
  });
  test('send message to socket', () async {
    homeViewModel.connectToSocket("1", RoomType.ROOM_ONE);
    homeViewModel.sendMessage(
      message: 'Test message',
      roomType: RoomType.ROOM_ONE,
      username: 'Tester',
    );

    expect(homeViewModel.messagesListForRoom1.isNotEmpty, true);
  });
  test('receive message from socket', () async {
    homeViewModel.connectToSocket("1", RoomType.ROOM_ONE);

    homeViewModel.sendMessage(
      message: 'Test message',
      roomType: RoomType.ROOM_ONE,
      username: 'Tester',
    );

    var receivedMessage = await homeViewModel.channel?.stream.first;

    expect(receivedMessage, 'test');
  });
}
