import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileViewController extends GetxController {
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var bio = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Clear the text controllers to ensure fields are empty
    nameController.clear();
    phoneNumberController.clear();
    bioController.clear();
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is removed from memory
    nameController.dispose();
    phoneNumberController.dispose();
    bioController.dispose();
    super.onClose();
  }

  void updateProfile() {
    // Update logic here
    // For example, you can call an API to update the profile details
    print('Name: ${name.value}');
    print('Phone Number: ${phoneNumber.value}');
    print('Bio: ${bio.value}');
  }
}
