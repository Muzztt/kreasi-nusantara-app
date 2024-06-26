import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/login_page/login/views/login_view.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password_confirmation_otp/views/forgot_password_confirmation_otp_view.dart';
import 'package:kreasi_nusantara/service/auth_service/auth_service.dart';
import 'package:kreasi_nusantara/service/auth_service_google/auth_service_google.dart';
import 'package:kreasi_nusantara/shared/util/db_service/db_service.dart';
import 'package:kreasi_nusantara/shared/util/log/log.dart';
import 'package:kreasi_nusantara/shared/util/show_loading/show_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      showLoading();
      await authService.login(
        email: email!,
        password: password!,
      );
      hideLoading();
      Get.offAll(const MainNavigationView());
    } on Exception catch (err) {
      hideLoading();
      se("Email atau password salah");
    }
  }

  doUsrLogin() async {
    try {
      await AuthServiceByGoogle().doUsrLogin();
      Get.to(const MainNavigationView());
    } on Exception catch (err) {
      print(err);
    }
  }

  String? email;
  String? password;
  String? otp;

  @override
  void onInit() {
    super.onInit();
    email = DBService.get("email");
    password = DBService.get("password");
  }

  forgotPassword() async {
    try {
      showLoading();
      await authService.forgotPassword(email!);
      hideLoading();

      Get.to(ForgotPasswordConfirmationOtpView());
    } on Exception catch (err) {
      hideLoading();
      ss(err);
    }
  }

  verifyOtp() async {
    try {
      showLoading();
      await AuthService().verifyOtp(email: email!, otp: otp!);
      hideLoading();

      ss("Berhasil membuat akun, silahkan login!");
    } on Exception catch (err) {
      hideLoading();
      se("Kode otp tidak valid");
    }
  }
}

LoginController loginController = Get.find();
