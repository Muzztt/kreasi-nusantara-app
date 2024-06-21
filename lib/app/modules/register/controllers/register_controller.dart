import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  // Observable variables for registration steps
  var firstName = ''.obs;
  var lastName = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var otp = ''.obs; // Add this line to define 'otp' variable

  // Validation methods
  // (Validation methods go here...)

  // Example method to validate and submit the registration form

  // Clear OTP value
  void clearOtp() {
    otp.value = '';
  }

  // Example method to simulate sending OTP
  void sendOtp() {
    // (OTP sending logic goes here...)
  }
}
