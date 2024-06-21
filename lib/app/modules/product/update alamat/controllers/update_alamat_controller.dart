import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateAlamatController extends GetxController {
  final String baseUrl =
      'https://kreasinusantara.shop/api/v1/users/me/addresses/';
  final String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  Future<void> updateAlamat({
    required String addressId,
    required String label,
    required String namaPenerima,
    required String telepon,
    required String alamat,
    required String kota,
    required String provinsi,
    required String kodePos,
    required bool isPrimary,
  }) async {
    try {
      var url = Uri.parse('$baseUrl$addressId');

      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'label': label, // Assuming label is fixed for updates
          'recipient_name': namaPenerima,
          'phone': telepon,
          'address': alamat,
          'city': kota,
          'province': provinsi,
          'postal_code': kodePos,
          'is_primary': isPrimary,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Address updated successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar(
            'Error', 'Failed to update address: ${response.statusCode}',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update address: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
