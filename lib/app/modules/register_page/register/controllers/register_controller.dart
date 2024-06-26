import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/login_page/login/views/login_view.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/app/modules/register_page/otp_register/views/otp_register_view.dart';
import 'package:kreasi_nusantara/service/auth_service/auth_service.dart';
import 'package:kreasi_nusantara/shared/util/log/log.dart';
import 'package:kreasi_nusantara/shared/util/random_data/random_data.dart';
import 'package:kreasi_nusantara/shared/util/show_loading/show_loading.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;

  String? otp;

  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      firstName = r.randomFirstName();
      lastName = r.randomLastName();
      username = r.randomUsername();
      email = r.randomEmail();
      password = "pd123456";
      Clipboard.setData(ClipboardData(text: email!));
    }
  }

  register() async {
    try {
      showLoading();
      await AuthService().register(
        firstName: firstName!,
        lastName: lastName!,
        username: username!,
        email: email!,
        password: password!,
      );
      hideLoading();
      Get.to(const OtpRegisterView());
    } on Exception catch (err) {
      se(err);
    }
  }

  verifyOtp() async {
    try {
      showLoading();
      await AuthService().verifyOtp(email: email!, otp: otp!);
      hideLoading();
      Get.to(
        const LoginView(),
      );
      ss("Berhasil membuat akun, silahkan login!");
    } on Exception catch (err) {
      hideLoading();
      se("Kode otp tidak valid");
    }
  }
}

RegisterController get registerController => Get.find<RegisterController>();
