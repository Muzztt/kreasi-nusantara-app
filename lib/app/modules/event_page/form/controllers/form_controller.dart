import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/shared/util/dialog/confirmation_dialog/confirmation_dialog.dart';

class FormController extends GetxController {
  //TODO: Implement FormController

  final count = 0.obs;

  void increment() => count.value++;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final idCardController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void doSave() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }
    bool confirm = await showConfirmationDialog();
    if (confirm) {
      // Perform save action here
      // For example, you can print a message or call a function to save the data
      print("Data saved successfully!");
    } else {
      print("Save action canceled.");
    }
  }
}
