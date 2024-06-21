import 'package:get/get.dart';

import '../controllers/payment_success_controller.dart';

class PaymentSuccess extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentSuccessController>(
      () => PaymentSuccessController(),
    );
  }
}
