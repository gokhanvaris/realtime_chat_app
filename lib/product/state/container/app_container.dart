import 'package:get_it/get_it.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';

final class AppContainer {
  const AppContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt.registerLazySingleton<HomeViewModel>(
      HomeViewModel.new,
    );
  }

  // ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
  /// read your dependency item for [AppContainer]
  static T read<T extends Object>() => _getIt<T>();
}
