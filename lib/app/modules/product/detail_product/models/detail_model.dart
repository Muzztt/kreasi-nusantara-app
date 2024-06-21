import 'package:get/get.dart';

class DetailedProduct {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;
  final String originalPrice;
  final String discountPrice;
  final String discountPercentage;
  final String rating;
  final int totalReviews;
  final List<LatestReview> latestReview;
  final List<Variant> variants;
  var isChecked = false.obs;
  RxInt quantity;

  DetailedProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.videos,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercentage,
    required this.rating,
    required this.totalReviews,
    required this.latestReview,
    required this.variants,
    bool isChecked = false,
    int quantity = 0,
  }) : quantity = quantity.obs;

  factory DetailedProduct.fromJson(Map<String, dynamic> json) {
    List<LatestReview> parsedReviews = [];
    if (json['latest_review'] != null) {
      parsedReviews.add(LatestReview.fromJson(json['latest_review']));
    } else {
      // Jika latest_review tidak ada, inisialisasikan dengan review kosong
      // parsedReviews.add(LatestReview.emptyReview());
    }
    return DetailedProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      videos: List<String>.from(json['videos']),
      originalPrice: json['original_price'].toString(),
      discountPrice: json['discount_price'].toString(),
      discountPercentage: json['discount_percent'].toString(),
      rating: json['average_rating'].toString(),
      totalReviews: json['total_review'],
      latestReview: parsedReviews,
      variants:
          (json['variants'] as List).map((v) => Variant.fromJson(v)).toList(),
    );
  }
}

class LatestReview {
  final String? userImageUrl;
  final String username;
  final int rating;
  final String createdAt;
  final String review;

  LatestReview({
    required this.userImageUrl,
    required this.username,
    required this.rating,
    required this.createdAt,
    required this.review,
  });

  factory LatestReview.fromJson(Map<String, dynamic> json) {
    final userImageUrl =
        json['user'] != null ? json['user']['image_url'] : null;
    final username =
        json['user'] != null ? json['user']['username'] : 'Anonymous';
    return LatestReview(
      userImageUrl: userImageUrl,
      username: username,
      rating: json['rating'],
      createdAt: json['created_at'],
      review: json['review'],
    );
  }
}

class Variant {
  final String size;
  final int stock;

  Variant({
    required this.size,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      size: json['size'],
      stock: json['stock'],
    );
  }
}
