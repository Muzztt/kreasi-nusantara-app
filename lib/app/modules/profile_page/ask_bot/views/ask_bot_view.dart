import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ask_bot_controller.dart';

class AskBotView extends GetView<AskBotController> {
  const AskBotView({super.key});

  @override
  Widget build(BuildContext context) {
    final AskBotController controller = Get.put(AskBotController());

    return WillPopScope(
      onWillPop: () async {
        controller.resetState();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chatbot',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 158, 158),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        'Today',
                        style:
                            TextStyle(color: Color(0xFFBA1A1A), fontSize: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Obx(() {
                    if (controller.hasSubmitted.value) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFBA1A1A),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.userQuery.value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    controller.userTimestamp.value,
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDECEC),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFFE5E5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.account_circle_outlined,
                                          color: Color(0xFFBA1A1A),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Obx(() => Text(
                                        controller.botResponse.value,
                                        style: const TextStyle(
                                          color: Color(0xFFBA1A1A),
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Obx(() => Text(
                                          controller.botTimestamp.value,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(60.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/iconbot.png',
                                width: 136,
                                height: 136,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Bagaimana saya dapat membantu Anda hari ini',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFFBA1A1A),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 120),
                          ],
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      hintText:
                          'Tanya Apapun Pasti Kejawab Dengan Bot Kreasi Nusantara',
                      hintStyle: const TextStyle(
                        fontSize: 14.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    maxLines: 2,
                    minLines: 1,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: controller.askBot,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      backgroundColor: const Color(0xFFBA1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Ask Bot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
