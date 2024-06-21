import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isTicketSectionExpanded = false;

  void toggleTicketSection() {
    isTicketSectionExpanded = !isTicketSectionExpanded;
    update();
  }
}
