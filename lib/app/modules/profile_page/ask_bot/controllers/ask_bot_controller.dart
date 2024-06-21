import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AskBotController extends GetxController {
  TextEditingController textController = TextEditingController();
  var botResponse = ''.obs;
  var userQuery = ''.obs;
  var hasSubmitted = false.obs;

  void askBot() {
    if (textController.text.isNotEmpty) {
      userQuery.value = textController.text;
      // Mock response for demonstration purposes
      botResponse.value =
          'Tentu, berikut beberapa batik yang sedang viral:\n1. Batik Mega Mendung - Cirebon\n2. Batik Kawung - Yogyakarta\n3. Batik Parang - Solo dan Yogyakarta';
      hasSubmitted.value = true;
      textController.clear();
    } else {
      botResponse.value = 'Silakan masukkan pertanyaan Anda.';
    }
  }

  void resetState() {
    botResponse.value = '';
    userQuery.value = '';
    hasSubmitted.value = false;
  }
}
