import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class Cart extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
