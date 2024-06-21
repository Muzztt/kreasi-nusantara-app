import 'package:get/get.dart';

import '../controllers/forgot_password_confirmation_otp_controller.dart';

class ForgotPasswordConfirmationOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordConfirmationOtpController>(
      () => ForgotPasswordConfirmationOtpController(),
    );
  }
}
