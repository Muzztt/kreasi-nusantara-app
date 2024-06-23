import 'package:get/get.dart';

import '../controllers/register_detail_controller.dart';

class RegisterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterDetailController>(
      () => RegisterDetailController(),
    );
  }
}
