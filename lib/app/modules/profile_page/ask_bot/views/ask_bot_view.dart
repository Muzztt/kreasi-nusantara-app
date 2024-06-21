import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ask_bot_controller.dart';

class AskBotView extends GetView<AskBotController> {
  const AskBotView({Key? key}) : super(key: key);

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
          elevation: 0, // Remove app bar shadow
          iconTheme: IconThemeData(color: Colors.black), // Back button color
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 223, 158, 158),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Today',
                        style:
                            TextStyle(color: Color(0xFFBA1A1A), fontSize: 12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // Adjusted height for better spacing
                  Obx(() {
                    if (controller.hasSubmitted.value) {
                      // Response State
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFDECEC),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFE5E5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/iconbot.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          'Anda bertanya:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    controller.userQuery.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFBA1A1A),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.botResponse.value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      // Initial State
                      SizedBox(height: 50);
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/iconbot.png', // Replace this with the correct path to your image
                                width: 136, // Adjusted width to match the image
                                height:
                                    136, // Adjusted height to match the image
                              ),
                            ),
                            SizedBox(
                                height:
                                    50), // Add spacing between icon and text
                            Row(
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
                            SizedBox(
                                height:
                                    150), // Add spacing between text and input
                          ],
                        ),
                      );
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.textController,
                          decoration: InputDecoration(
                            hintText:
                                'Tanya apapun pasti kejawab dengan Bot Kreasi Nusantara',
                            hintStyle: TextStyle(
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
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          minLines: 1,
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: controller.askBot,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                            backgroundColor: Color(0xFFBA1A1A),
                            padding: EdgeInsets.all(0),
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
          ],
        ),
      ),
    );
  }
}
