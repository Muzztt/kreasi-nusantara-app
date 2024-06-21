import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kreasi_nusantara/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final getStorage = GetStorage();

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("status") != "" && getStorage.read("status") != null) {
      Future.delayed(const Duration(seconds: 10), () {
        Get.offAllNamed(Routes.MAIN_NAVIGATION);
      });
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }

  void increment() => count.value++;
}
