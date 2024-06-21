import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kreasi_nusantara/app/modules/event_page/checkout/views/checkout_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/status/views/status_view.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

import '../controllers/checkout_navigation_controller.dart';

class CheckoutNavigationView extends GetView<CheckoutNavigationController> {
  const CheckoutNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StepNavigation(
          initialIndex: 1,
          navigations: const [
            "Contact",
            "Payment",
            "Status",
          ],
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/128/10438/10438164.png",
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  "Developer Mode",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const CheckoutView(),
            const StatusView(),
          ],
        ),
      ),
    );
  }
}
