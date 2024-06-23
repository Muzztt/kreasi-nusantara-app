import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/register_page/otp_register/views/otp_register_view.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';

import '../controllers/register_detail_controller.dart';

class RegisterDetailView extends GetView<RegisterDetailController> {
  const RegisterDetailView({super.key});
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
        height: 480,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Buat akun baru",
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
                  "sebelum itu, perkenalkan nama anda",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                QTextField(
                  label: "Username",
                  validator: Validator.email,
                  suffixIcon: Icons.email,
                  value: null,
                  onChanged: (value) {},
                ),
                QTextField(
                  label: "Email",
                  validator: Validator.email,
                  suffixIcon: Icons.email,
                  value: null,
                  onChanged: (value) {},
                ),
                QTextField(
                  label: "Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: null,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 18.0,
                ),
                QButton(
                  label: "Daftar",
                  onPressed: () => Get.offAll(const OtpRegisterView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
