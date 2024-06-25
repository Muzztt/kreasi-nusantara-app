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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
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
