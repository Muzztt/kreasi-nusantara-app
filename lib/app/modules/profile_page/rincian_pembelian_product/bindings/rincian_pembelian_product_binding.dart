import 'package:get/get.dart';

import '../controllers/rincian_pembelian_product_controller.dart';

class RincianPembelianProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RincianPembelianProductController>(
      () => RincianPembelianProductController(),
    );
  }
}
