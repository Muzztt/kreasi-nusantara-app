import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class Checkout extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutProductController>(
      () => CheckoutProductController(),
    );
  }
}
