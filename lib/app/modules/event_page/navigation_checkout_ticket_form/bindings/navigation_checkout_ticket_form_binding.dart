import 'package:get/get.dart';

import '../controllers/navigation_checkout_ticket_form_controller.dart';

class NavigationCheckoutTicketFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationCheckoutTicketFormController>(
      () => NavigationCheckoutTicketFormController(),
    );
  }
}
