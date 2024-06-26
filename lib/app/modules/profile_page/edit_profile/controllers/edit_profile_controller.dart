import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/service/user_service/user_service.dart';
import 'package:kreasi_nusantara/shared/util/log/log.dart';
import 'package:kreasi_nusantara/shared/util/show_loading/show_loading.dart';

class EditProfileViewController extends GetxController {
  var name = '';
  var phoneNumber = '';
  var bio = '';

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

  String? firstName;
  String? lastName;
  String? phone;
  String? gender;
  String? dateOfBirth;

  void updateProfile() async {
    try {
      showLoading();
      await UserService().update("me", {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "gender": gender,
        "date_of_birth": dateOfBirth
      });
      hideLoading();
      Get.to(() => const MainNavigationView());
      ss("Berhasil mengupdate data");
    } on Exception catch (err) {
      se(err);
    }
  }
}
