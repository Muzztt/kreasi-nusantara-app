import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/password_page/new_password/views/new_password_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/otp_field/otp_field.dart';

import '../controllers/forgot_password_confirmation_otp_controller.dart';

class ForgotPasswordConfirmationOtpView
    extends GetView<ForgotPasswordConfirmationOtpController> {
  ForgotPasswordConfirmationOtpView({super.key});
  @override
  final ForgotPasswordConfirmationOtpController controller =
      Get.find<ForgotPasswordConfirmationOtpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: CustomBottomSheet(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lupa Kata Sandi",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                "Jangan khawatir, kami akan membantu anda mengatur ulang kata sandi anda",
                style: TextStyle(fontSize: 12.0),
              ),
              const SizedBox(height: 24.0),
              QOtpField(
                length: 4,
                onChanged: (otp) {
                  controller.otp.value = otp;
                },
                enabled: !controller.isLoading.value,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Obx(() {
                return QButton(
                  label: controller.isLoading.value ? 'Loading...' : 'Lanjut',
                  colorButton: primaryColor,
                  onPressed: () {
                    controller.verifyOtp();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
