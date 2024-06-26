import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String id;
  final String? imageUrl;
  final String productName;
  final String originalPrice;
  final String discountPercentage;
  final String discountedPrice;
  final String rating;
  final int totalReviews;
  var isChecked = false.obs;
  RxInt quantity;

  ProductCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.originalPrice,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.rating,
    required this.totalReviews,
    bool isChecked = false,
    int quantity = 0,
  }) : quantity = quantity.obs;

  factory ProductCard.fromJson(Map<String, dynamic> json) {
    return ProductCard(
      id: json['id'],
      imageUrl: json['image'],
      productName: json['name'],
      originalPrice: json['original_price'].toString(), // Convert int to String
      discountPercentage:
          json['discount_percent'].toString(), // Convert int to String
      discountedPrice:
          json['discount_price'].toString(), // Convert int to String
      rating: json['average_rating'].toString(), // Convert int to String
      totalReviews: json['total_review'],
    );
  }

  @override
  Widget build(BuildContext context) {
    double ratingValue = double.parse(rating);

    String formattedRating = ratingValue.toStringAsFixed(1);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            imageUrl != null && imageUrl!.isNotEmpty
                ? Image.network(
                    imageUrl!,
                    width: 171.0,
                    height: 153.0,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                    width: 171.0,
                    height: 153.0,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(
              height: 6,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productName,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "IDR $originalPrice",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$discountPercentage%",
                    style: GoogleFonts.poppins(
                      color: Color(0xffC00C25),
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "IDR $discountedPrice",
                style: GoogleFonts.poppins(
                  color: Color(0xff3E3E3E),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(formattedRating),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  Icons.star,
                  color: Color(0xffFFC700),
                  size: 16,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "($totalReviews Reviews)",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xff797979)),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
