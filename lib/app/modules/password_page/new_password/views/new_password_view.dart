import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/dialog/info_dialog/info_dialog.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});
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
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Akun berhasil dipulihkan",
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
                  "silahkan masukkan password baru anda",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                QTextField(
                  label: "Masukkan Password Baru",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: null,
                  onChanged: (value) {},
                ),
                QTextField(
                  label: "Masukkan Kembali Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: null,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                QButton(
                  label: "Masuk",
                  colorButton: primaryColor,
                  onPressed: () {
                    showInfoDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return InfoDialog(
        title: "Basic dialog title",
        message: "Login Success masbro",
        buttonLabel: "Label",
        icon: Icons.check_circle_rounded,
        iconColor: Colors.green,
        onPressed: () {
          Get.to(
            const MainNavigationView(),
          );
        },
      );
    },
  );
}
