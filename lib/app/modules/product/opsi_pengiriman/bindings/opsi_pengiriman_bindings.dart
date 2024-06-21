import 'package:get/get.dart';

import '../controllers/opsi_pengiriman_controller.dart';

class ProductView extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpsiPengirimanController>(
      () => OpsiPengirimanController(),
    );
  }
}
