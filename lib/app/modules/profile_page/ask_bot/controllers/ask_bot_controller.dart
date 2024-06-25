import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'dart:io';

class AskBotController extends GetxController {
  var hasSubmitted = false.obs;
  var userQuery = ''.obs;
  var botResponse = ''.obs;
  var userTimestamp = ''.obs;
  var botTimestamp = ''.obs;
  TextEditingController textController = TextEditingController();
  var isLoading = false.obs;

  late WebSocketChannel channel;
  final String apiUrl = 'wss://kreasinusantara.shop/api/v1/chatbot';
  final String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxNzM4MjQyfQ.z0PaFAzU1blsZQ-YYqCVOmNxsQtrtzWdqqesGQWY-vE';

  @override
  void onInit() {
    super.onInit();
    connectToWebSocket();
  }

  Future<void> connectToWebSocket() async {
    try {
      final headers = {
        'Authorization': 'Bearer $key',
      };
      final websocket = await WebSocket.connect(apiUrl, headers: headers);
      channel = IOWebSocketChannel(websocket);

      channel.stream.listen((message) {
        try {
          final responseData = jsonDecode(message);
          botResponse.value = responseData['choices'][0]['message']['content'];
          botTimestamp.value = _getCurrentTime();
        } catch (e) {
          botResponse.value = message;
          botTimestamp.value = _getCurrentTime();
        } finally {
          isLoading.value = false;
        }
      }, onError: (error) {
        handleError('Failed to get response. Error: $error');
        isLoading.value = false;
      }, onDone: () {
        handleError('WebSocket connection closed.');
        isLoading.value = false;
      });
    } catch (e) {
      handleError('Failed to connect. Error: $e');
    }
  }

  void askBot() {
    final query = textController.text.trim();
    if (query.isEmpty) return;

    if (!containsRelevantKeywords(query)) {
      userQuery.value = "Kreasi Nusantara";
      userTimestamp.value = _getCurrentTime();
      hasSubmitted.value = true;
      textController.clear();
      return;
    }

    userQuery.value = query;
    userTimestamp.value = _getCurrentTime();
    hasSubmitted.value = true;
    textController.clear();
    isLoading.value = true;

    final request = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": query}
      ],
      'max_tokens': 250,
    });

    try {
      channel.sink.add(request);
    } catch (e) {
      handleError('Failed to send request. Error: $e');
    }
  }

  void handleError(String message) {
    botResponse.value = message;
    botTimestamp.value = _getCurrentTime();
  }

  bool containsRelevantKeywords(String message) {
    return true;
  }

  void resetState() {
    hasSubmitted.value = false;
    userQuery.value = '';
    botResponse.value = '';
    userTimestamp.value = '';
    botTimestamp.value = '';
    textController.clear();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    var status;
    channel.sink.close(status.goingAway);
    super.onClose();
  }
}