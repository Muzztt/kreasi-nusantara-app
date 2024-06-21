import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahAlamatController extends GetxController {
  var isLoading = false.obs;
  final String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  Future<void> tambahAlamat({
    required String label,
    required String namaPenerima,
    required String telepon,
    required String alamat,
    required String kota,
    required String provinsi,
    required String kodePos,
    required bool isPrimary,
  }) async {
    isLoading(true);
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/users/me/addresses');
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'label': label,
          'recipient_name': namaPenerima,
          'phone': telepon,
          'address': alamat,
          'city': kota,
          'province': provinsi,
          'postal_code': kodePos,
          'is_primary': isPrimary,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Berhasil', 'Alamat berhasil ditambahkan',
            backgroundColor: Colors.green);
      } else {
        Get.snackbar(
            'Error', 'Gagal menambahkan alamat: ${response.statusCode}',
            backgroundColor: Color(0xFFE53935));
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
