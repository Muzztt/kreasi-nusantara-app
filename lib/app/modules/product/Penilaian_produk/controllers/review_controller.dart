import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/models/all_review_model.dart';

class ReviewController extends GetxController {
  final String productId;
  var reviewAll = <ReviewAll>[].obs;
  var isLoading = true.obs;
  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  ReviewController({required this.productId});

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  void fetchReviews() async {
    try {
      var url = Uri.parse(
          'https://kreasinusantara.shop/api/v1/products/$productId/reviews');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var reviewsList = (jsonData['data'] as List)
            .map((item) => ReviewAll.fromJson(item))
            .toList();
        reviewAll.assignAll(reviewsList);
      } else {
        print('Failed to load reviews: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading reviews: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
