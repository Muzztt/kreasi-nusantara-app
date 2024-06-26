import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password_confirmation_otp/views/forgot_password_confirmation_otp_view.dart';
import 'package:kreasi_nusantara/models/forgot_password/forgot_password.dart';
import 'package:kreasi_nusantara/service/auth_service/auth_service.dart';

class ForgotPasswordController extends GetxController {
  final count = 0.obs;
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  var email = ''.obs;

  void increment() => count.value++;

  Future<void> sendForgotPasswordRequest() async {
    isLoading(true);
    try {
      if (email.value.isEmpty) {
        Get.snackbar('Error', 'Email cannot be empty');
        return;
      }
      ForgotPassword response = await authService.forgotPassword(email.value);
      Get.snackbar('Success', response.message);

      // Print email value before navigating
      print(
          'Navigating to ForgotPasswordConfirmationOtpView with email: ${email.value}');

      Get.to(ForgotPasswordConfirmationOtpView(), arguments: email.value);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
