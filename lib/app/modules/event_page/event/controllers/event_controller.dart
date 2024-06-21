import 'package:get/get.dart';

class EventController extends GetxController {
  //TODO: Implement EventController

  var nik = ''.obs;
  var nama = ''.obs;
  var noTelepon = ''.obs;
  var email = ''.obs;

  // Tambahkan logika validasi di sini jika diperlukan
  bool validateNik(String value) {
    return value.length <= 16;
  }
}
