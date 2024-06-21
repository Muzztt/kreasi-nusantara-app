import 'package:get/get.dart';

import '../controllers/checkout_navigation_controller.dart';

class CheckoutNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutNavigationController>(
      () => CheckoutNavigationController(),
    );
  }
}
