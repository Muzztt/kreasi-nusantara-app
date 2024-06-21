import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import 'register1_view.dart';
import 'register2_view.dart';
import 'otp_view.dart';

class RegisterView extends GetView {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    final PageController pageController =
        Get.put(PageController()); // Menambahkan PageController ke GetX

    return Scaffold(
      body: PageView(
        controller: pageController, // Menggunakan PageController dari GetX
        children: const [
          Register1View(),
          Register2View(),
          OtpView(),
        ],
      ),
    );
  }
}
