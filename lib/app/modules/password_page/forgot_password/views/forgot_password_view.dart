import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password_confirmation_otp/views/forgot_password_confirmation_otp_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
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
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "Jangan khawatir, kami akan membantu anda mengatur ulang kata sandi anda",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              QTextField(
                label: "Email",
                validator: Validator.required,
                value: null,
                onChanged: (value) {
                  controller.email.value = value;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              Obx(() {
                return QButton(
                    label: controller.isLoading.value ? 'Loading...' : 'Masuk',
                    colorButton: primaryColor,
                    onPressed: () {
                      controller.sendForgotPasswordRequest();
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
