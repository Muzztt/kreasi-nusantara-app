import 'package:get/get.dart';

import '../controllers/alamat_controller.dart';

class Alamat extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlamatController>(
      () => AlamatController(),
    );
  }
}
