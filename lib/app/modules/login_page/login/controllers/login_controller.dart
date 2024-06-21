import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/service/auth_service/auth_service.dart';
import 'package:kreasi_nusantara/service/auth_service_google/auth_service_google.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      print(emailController.text);
      print(passwordController.text);

      final response = await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      print(response);

      isLoading.value = false;

      if (response['status'] == "success") {
        print("Masuk di status success");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['data']["token"]);
        Get.offAll(
            const MainNavigationView()); // Pastikan rute sesuai dengan yang Anda inginkan
      } else {
        print("Masuk dibagian gagal");
        errorMessage.value = response['message'];
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }

  doUsrLogin() async {
    try {
      await AuthServiceByGoogle().doUsrLogin();
      Get.offAll(const MainNavigationView());
    } on Exception catch (err) {
      print(err);
    }
  }
}
