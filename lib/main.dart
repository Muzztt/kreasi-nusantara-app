import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_kalender/controllers/event_kalender_controller.dart';
import 'package:kreasi_nusantara/app/modules/event_page/form/controllers/form_controller.dart';
import 'package:kreasi_nusantara/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:kreasi_nusantara/app/modules/login_page/login/controllers/login_controller.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/controllers/main_navigation_controller.dart';
import 'package:kreasi_nusantara/app/modules/login_page/splash_screen/bindings/splash_screen_binding.dart';
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/controllers/review_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/controllers/alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/controllers/cart_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/controllers/detail_product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/opsi_pengiriman/controllers/opsi_pengiriman_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/payment/controllers/payment_success_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/product_page/controllers/product_view_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/tambah%20alamat/controllers/tambah_alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/update%20alamat/controllers/update_alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password/controllers/forgot_password_controller.dart';
import 'package:kreasi_nusantara/app/modules/password_page/forgot_password_confirmation_otp/controllers/forgot_password_confirmation_otp_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/login_page/splash_screen/bindings/splash_screen_binding.dart';
import 'package:kreasi_nusantara/firebase_options.dart';

import 'package:kreasi_nusantara/shared/theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductViewController());
  Get.put(DetailProductController());
  Get.put(CartController());
  Get.put(AlamatController());
  Get.put(PaymentSuccessController());
  Get.put(OpsiPengirimanController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(ProductController());
  Get.put(FormController());
  Get.put(EventKalenderController());
  Get.put(CheckoutProductController());
  Get.put(MainNavigationController());
  Get.put(TambahAlamatController());
  Get.put(UpdateAlamatController());
  Get.put(ForgotPasswordController());
  Get.put(ForgotPasswordConfirmationOtpController());
  Get.put(LoginController());
  Get.put(HomePageController());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getDefaultTheme(),
      initialBinding: SplashScreenBinding(),
    ),
  );
}
