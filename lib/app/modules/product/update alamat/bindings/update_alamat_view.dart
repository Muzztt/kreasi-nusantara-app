import 'package:get/get.dart';

import '../controllers/update_alamat_controller.dart';

class TambahAlamat extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAlamatController>(
      () => UpdateAlamatController(),
    );
  }
}
