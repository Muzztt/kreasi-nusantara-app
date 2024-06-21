import 'package:get/get.dart';

import '../controllers/ask_bot_controller.dart';

class AskBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskBotController>(
      () => AskBotController(),
    );
  }
}
