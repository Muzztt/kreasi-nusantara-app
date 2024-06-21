import 'package:get/get.dart';

import '../controllers/rincian_pembelian_ticket_controller.dart';

class RincianPembelianTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RincianPembelianTicketController>(
      () => RincianPembelianTicketController(),
    );
  }
}
