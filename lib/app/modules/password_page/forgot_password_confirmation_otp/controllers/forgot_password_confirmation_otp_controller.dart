import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/password_page/new_password/views/new_password_view.dart';
import 'package:kreasi_nusantara/service/auth_service/auth_service.dart';

class ForgotPasswordConfirmationOtpController extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  var otp = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;

    // Logging the arguments to debug
    print("Get.arguments: $arguments");

    // if (arguments != null && arguments is String) {
    //   email.value = arguments;
    // } else {
    //   Get.snackbar('Error', 'No email provided or invalid argument type');
    //   // Navigate back or handle the error appropriately
    //   // For example: Get.back();
    // }
  }

  Future<void> verifyOtp() async {
    isLoading(true);
    try {
      if (otp.value.length < 4) {
        Get.snackbar('Error', 'OTP must be 4 digits');
        return;
      }
      print(
          'Verifying OTP for email: ${email.value} and OTP: ${otp.value}'); // Add this line for debugging
      bool isVerified =
          await authService.verifyOtp(email: email.value, otp: otp.value);
      if (isVerified) {
        Get.snackbar('Success', 'OTP verified successfully');
        Get.offAll(() => const NewPasswordView());
      } else {
        Get.snackbar('Error', 'Invalid OTP');
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        Get.snackbar('Server Error',
            'There is an issue with the server. Please try again later.');
      } else {
        Get.snackbar('Error', e.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
