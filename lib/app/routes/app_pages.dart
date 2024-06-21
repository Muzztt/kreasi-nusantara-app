import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/product/product_page/bindings/product_binding.dart';
import '../modules/profile_page/ask_bot/bindings/ask_bot_binding.dart';
import '../modules/profile_page/ask_bot/views/ask_bot_view.dart';
import '../modules/profile_page/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/profile_page/edit_profile/views/edit_profile_view.dart';
import '../modules/profile_page/rincian_pembelian_product/bindings/rincian_pembelian_product_binding.dart';
import '../modules/profile_page/rincian_pembelian_product/views/rincian_pembelian_product_view.dart';
import '../modules/profile_page/rincian_pembelian_ticket/bindings/rincian_pembelian_ticket_binding.dart';
import '../modules/profile_page/rincian_pembelian_ticket/views/rincian_pembelian_ticket_view.dart';
import '../modules/article_page/article/bindings/article_binding.dart';
import '../modules/article_page/article/views/article_view.dart';
import '../modules/article_page/article_detail/bindings/article_detail_binding.dart';
import '../modules/article_page/article_detail/views/article_detail_view.dart';
import '../modules/event_page/checkout/bindings/checkout_binding.dart';
import '../modules/event_page/checkout/views/checkout_view.dart';
import '../modules/event_page/checkout_navigation/bindings/checkout_navigation_binding.dart';
import '../modules/event_page/checkout_navigation/views/checkout_navigation_view.dart';
import '../modules/event_page/description/bindings/description_binding.dart';
import '../modules/event_page/description/views/description_view.dart';
import '../modules/event_page/event/bindings/event_binding.dart';
import '../modules/event_page/event/views/event_view.dart';
import '../modules/event_page/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_page/event_detail/views/event_detail_view.dart';
import '../modules/event_page/form_page/bindings/form_page_binding.dart';
import '../modules/event_page/form_page/views/form_page_view.dart';
import '../modules/event_page/status/bindings/status_binding.dart';
import '../modules/event_page/status/views/status_view.dart';
import '../modules/event_page/ticket/bindings/ticket_binding.dart';
import '../modules/event_page/ticket/views/ticket_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/login/bindings/login_binding.dart';
import '../modules/login_page/login/views/login_view.dart';
import '../modules/login_page/main_navigation/bindings/main_navigation_binding.dart';
import '../modules/login_page/main_navigation/views/main_navigation_view.dart';
import '../modules/login_page/onboarding/bindings/onboarding_binding.dart';
import '../modules/login_page/onboarding/views/onboarding_view.dart';
import '../modules/login_page/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/login_page/splash_screen/views/splash_screen_view.dart';
import '../modules/password_page/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/password_page/forgot_password/views/forgot_password_view.dart';
import '../modules/password_page/forgot_password_confirmation_otp/bindings/forgot_password_confirmation_otp_binding.dart';
import '../modules/password_page/forgot_password_confirmation_otp/views/forgot_password_confirmation_otp_view.dart';
import '../modules/password_page/new_password/bindings/new_password_binding.dart';
import '../modules/password_page/new_password/views/new_password_view.dart';
import '../modules/product/product_page/views/product_view.dart';
import '../modules/profile_page/profile/bindings/profile_binding.dart';
import '../modules/profile_page/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: Routes.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.MAIN_NAVIGATION,
      page: () => const MainNavigationView(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.ASK_BOT,
      page: () => const AskBotView(),
      binding: AskBotBinding(),
    ),
    GetPage(
      name: _Paths.RINCIAN_PEMBELIAN_PRODUCT,
      page: () => const RincianPembelianProductView(),
      binding: RincianPembelianProductBinding(),
    ),
    GetPage(
      name: _Paths.RINCIAN_PEMBELIAN_TICKET,
      page: () => const RincianPembelianTicketView(),
      binding: RincianPembelianTicketBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.STATUS,
      page: () => const StatusView(),
      binding: StatusBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PAGE,
      page: () => FormPageView(),
      binding: FormPageBinding(),
    ),
    GetPage(
      name: _Paths.DESCRIPTION,
      page: () => const DescriptionView(),
      binding: DescriptionBinding(),
    ),
    GetPage(
      name: _Paths.TICKET,
      page: () => const TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_NAVIGATION,
      page: () => const CheckoutNavigationView(),
      binding: CheckoutNavigationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_CONFIRMATION_OTP,
      page: () => ForgotPasswordConfirmationOtpView(),
      binding: ForgotPasswordConfirmationOtpBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => const ArticleDetailView(),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
    ),
  ];
}
