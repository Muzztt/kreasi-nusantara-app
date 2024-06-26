import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password/views/forgot_password_view.dart';
import 'package:kreasi_nusantara/app/modules/register_page/register/views/register_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/shared/util/db_service/db_service.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';

import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/outline_button_image_button.dart';
import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selamat Datang di Kreasi Nusantara",
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
                    "Masukkan email atau username",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  QTextField(
                    label: "Email / Username",
                    validator: Validator.email,
                    suffixIcon: Icons.email,
                    value: controller.email,
                    onChanged: (value) {
                      controller.email = value;
                      controller.emailController.text = value;
                      DBService.set("email", value);
                    },
                  ),
                  QTextField(
                    label: "Password",
                    obscure: true,
                    validator: Validator.required,
                    // suffixIcon: Icons.visibility_off,
                    value: controller.password,
                    onChanged: (value) {
                      controller.password = value;
                      controller.passwordController.text = value;
                      DBService.set("password", value);
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Get.to(const ForgotPasswordView()),
                        child: Text(
                          "Lupa Password",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Obx(() {
                    return controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              if (controller.errorMessage.isNotEmpty)
                                Text(
                                  controller.errorMessage.value,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              QOutlineImageButton(
                                label: "Masuk menggunakan google",
                                color: primaryColor,
                                onPressed: () =>
                                    Get.to(const MainNavigationView()),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              QButton(
                                label: "Masuk",
                                colorButton: primaryColor,
                                onPressed: controller.login,
                              ),
                            ],
                          );
                  }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun?  ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(const RegisterView()),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
