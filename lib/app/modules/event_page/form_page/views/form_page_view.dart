import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/checkout/views/checkout_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event/controllers/event_controller.dart';
import 'package:kreasi_nusantara/app/modules/event_page/status/views/status_view.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/validator/validator.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button.dart';
import 'package:kreasi_nusantara/shared/widget/form/number_field/number_field.dart';
import 'package:kreasi_nusantara/shared/widget/form/test/test_widget.dart';

import 'package:kreasi_nusantara/shared/widget/form/textfield/textfield.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

class FormPageView extends StatelessWidget {
  final EventController controller = Get.put(EventController());

  FormPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StepNavigation(
          initialIndex: 0,
          navigations: const ["Contact", "Payment", "Status"],
          children: [
            _buildContactForm(),
            const CheckoutView(),
            const StatusView(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            QNumberField(
              hint: "Nomor Identitas",
              label: "Nomor Identitas",
              //  validator: Validator.required,
              value: null,
              onChanged: (value) {},
            ),
            QTextField(
              hint: "Nama Lengkap",
              label: "Nama Lengkap",
              // validator: Validator.required,
              value: null,
              onChanged: (value) {},
            ),
            QTextField(
              hint: "Email",
              label: "Email",
              // validator: Validator.required,
              value: null,
              onChanged: (value) {},
            ),
            QNumberField(
              label: "No. Telepon",
              hint: "Masukan nomor telepon",
              // validator: Validator.required,
              value: null,
              onChanged: (value) {},
            ),
            const SizedBox(height: 200.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: QActionButton(
                label: "Lanjut",
                onPressed: () {
                  // Aksi yang dilakukan saat tombol ditekan
                  var stepNavigationController =
                      StepNavigationController.instance;
                  stepNavigationController.updateIndex(1);
                },
                verticalPadding: 10.0, // Atur padding vertikal
                horizontalPadding: 300.0, // Atur padding horizontal

              ),
            ),
          ],
        ),
      ),
    );
  }
}
