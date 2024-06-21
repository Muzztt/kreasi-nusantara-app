import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/controllers/review_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/models/all_review_model.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/models/detail_model.dart';

class Review extends GetView<ReviewController> {
  final DetailedProduct product;
  final String productId;

  Review({super.key, required this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            "Semua Ulasan",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: [],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Penilaian Produk",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 26.0,
                  color: Color(0xffFFC700),
                ),
                Text(
                  product.rating,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 26),
                ),
                Text(
                  "/5.0",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "99% Pembeli Merasa Puas",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff2F2F2F),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          "1.783 Rating ",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        const Icon(
                          Icons.circle,
                          size: 7.0,
                          color: Color(0xff797979),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          product.totalReviews.toString() + " Ulasan",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Obx(() {
                return _buildSingleReview(controller.reviewAll);
              }),
            )
          ],
        ),
      )),
    );
  }
}

Widget _buildSingleReview(List<ReviewAll> reviews) {
  if (reviews.isEmpty) {
    return Center(
      child: Container(
        color: Colors.white,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16.5),
              child: Text(
                'Belum ada review produk',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5D5F5F),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: reviews.length,
    itemBuilder: (context, index) {
      final review = reviews[index];
      DateTime reviewDate = DateTime.parse(review.createdAt);
      DateTime now = DateTime.now();
      Duration difference = now.difference(reviewDate);

      String timeAgo;
      if (difference.inDays >= 30) {
        int months = (difference.inDays / 30).floor();
        timeAgo = '$months Bulan yang lalu';
      } else if (difference.inDays >= 1) {
        timeAgo = '${difference.inDays} Hari yang lalu';
      } else if (difference.inHours >= 1) {
        timeAgo = '${difference.inHours} Jam yang lalu';
      } else {
        timeAgo = '${difference.inMinutes} Menit yang lalu';
      }

      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: review.imageUrl != null
                      ? NetworkImage(review.imageUrl!)
                      : const NetworkImage(
                          'https://assets-a1.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.username,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xFF5D5F5F),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: List.generate(
                          review.rating,
                          (index) => const Icon(
                            Icons.star,
                            color: Color(0xffFFC700),
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (review.createdAt.isNotEmpty)
                        Text(
                          timeAgo,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.5,
                            color: const Color(0xB267727E),
                          ),
                        ),
                      const SizedBox(height: 2),
                      Text(
                        review.reviewText,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          letterSpacing: 0.2,
                          color: const Color(0xff5D5F5F),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
