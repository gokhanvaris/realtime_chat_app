import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/state/container/app_container.dart';

final class ProductStateItems {
  const ProductStateItems._();

  // static ProductNetworkManager get productNetworkManager =>
  //     ProductContainer.read<ProductNetworkManager>();

  static HomeViewModel get homeViewModel => AppContainer.read<HomeViewModel>();
}
