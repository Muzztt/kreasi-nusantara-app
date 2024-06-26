import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/app/modules/register_page/register/controllers/register_controller.dart';
import 'package:kreasi_nusantara/shared/util/dialog/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/dialog/info_dialog/info_dialog.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/otp_field/otp_field.dart';

import '../controllers/otp_register_controller.dart';

class OtpRegisterView extends GetView<OtpRegisterController> {
  const OtpRegisterView({super.key});
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
                "kode otp telah dikirim",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                "masukkan 4 kode unik yang kami kirim",
                style: TextStyle(fontSize: 12.0),
              ),
              const SizedBox(height: 24.0),
              QOtpField(
                length: 4,
                onChanged: (otp) {
                  registerController.otp = otp;
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              QButton(
                label: "Lanjut",
                onPressed: () async {
                  await registerController.verifyOtp();
                },
              ),
            ],
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
        title: "Perubahan Berhasil",
        message: "ubah password berhasil",
        buttonLabel: "kembali",
        icon: Icons.check_circle_rounded,
        iconColor: Colors.green,
        onPressed: () {
          Get.back();
        },
      );
    },
  );
}
