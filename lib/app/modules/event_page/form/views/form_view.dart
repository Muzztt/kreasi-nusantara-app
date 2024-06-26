import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';
import 'package:kreasi_nusantara/shared/widget/form/number_field/number_field.dart';
import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.87,
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                QNumberField(
                  hint: "Nomor Identitas",
                  label: "Nomor Identitas",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.idCardController.text = value;
                  },
                ),
                QTextField(
                  hint: "Nama Lengkap",
                  label: "Nama Lengkap",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.fullNameController.text = value;
                  },
                ),
                QTextField(
                  hint: "Email",
                  label: "Email",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.emailController.text = value;
                  },
                ),
                QNumberField(
                  label: "No. Telepon",
                  hint: "Masukan nomor telepon",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.phoneNumberController.text = value;
                  },
                ),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: const EdgeInsets.all(12.0),
                  child: QActionButton(
                    label: "Lanjut",
                    onPressed: () {
                      // Aksi yang dilakukan saat tombol ditekan
                      // controller.doSave;
                      var stepNavigationController =
                          StepNavigationController.instance;
                      stepNavigationController.updateIndex(1);
                    },
                    verticalPadding: 10.0, // Atur padding vertikal
                    horizontalPadding: 300.0, // Atur padding horizontal
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
