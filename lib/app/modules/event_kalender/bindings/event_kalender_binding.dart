import 'package:get/get.dart';

import '../controllers/event_kalender_controller.dart';

class EventKalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventKalenderController>(
      () => EventKalenderController(),
    );
  }
}
