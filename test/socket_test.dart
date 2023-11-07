import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/config/app_config.dart';

void main() {
  late final HomeViewModel homeViewModel;
  setUp(() {
    AppEnvironmentConfig.install(config: AppEnv());
    homeViewModel = HomeViewModel();
  });
  test('connect to socket', () async {
    homeViewModel.connectToSocket("1");

    expect(homeViewModel.isWebSocketInitialized, true);
  });
}
