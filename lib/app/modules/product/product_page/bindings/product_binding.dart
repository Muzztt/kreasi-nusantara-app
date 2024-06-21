import 'package:get/get.dart';

import '../controllers/product_view_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductViewController>(
      () => ProductViewController(),
    );
  }
}
