import 'package:get/get.dart';
import 'package:shop_store/app/modules/product/controllers/product_controller.dart';

import '../controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
  }
}
