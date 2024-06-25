import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/checkout/views/checkout_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/form/views/form_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/status/views/status_view.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

import '../controllers/navigation_checkout_ticket_form_controller.dart';

class NavigationCheckoutTicketFormView
    extends GetView<NavigationCheckoutTicketFormController> {
  const NavigationCheckoutTicketFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const StepNavigation(
          initialIndex: 0,
          navigations: [
            "Contact",
            "Payment",
            "Status",
          ],
          children: [
            FormView(),
            CheckoutView(),
            StatusView(),
          ],
        ),
      ),
    );
  }
}
