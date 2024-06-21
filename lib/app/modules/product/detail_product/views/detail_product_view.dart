import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/bindings/review_binding.dart';
import 'package:kreasi_nusantara/app/modules/product/Penilaian_produk/views/review_view.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/views/cart_view.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/models/detail_model.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';

import '../../widgets/size.dart';
import '../../checkout/views/checkout_view.dart';

class DetailProductView extends GetView<ProductController> {
  final DetailedProduct product;
  final ProductCard produk;
  final List<LatestReview> review;
  final List<Variant> varian;

  const DetailProductView({
    super.key,
    required this.product,
    required this.produk,
    required this.review,
    required this.varian,
  });

  Widget _buildAppBar(DetailedProduct product) {
    return Container(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 430,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              height: 1.3,
              color: const Color(0xFF980019),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              letterSpacing: 0.2,
              color: const Color(0xFF575859),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                'IDR ${product.originalPrice}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  height: 0.8,
                  color: const Color(0xFF797979),
                  decorationColor: const Color(0xFF797979),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${product.discountPercentage}%',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 0.8,
                  color: const Color(0xFFC00C25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'IDR ${product.discountPrice}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 0.5,
              color: const Color(0xFF980019),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 3.5, 16, 5.5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFC6C6C6), width: 1),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Text(
                  'Deskripsi',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0.2,
                    color: const Color(0xFF575859),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 29),
            child: Text(
              product.description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                height: 1.7,
                letterSpacing: 0.2,
                color: const Color(0xFF575859),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFC6C6C6), width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4.5),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: Text(
                'Selengkapnya',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: 0.2,
                  color: const Color(0xFF980019),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview() {
    double rating = double.parse(product.rating);

    String formattedRating = rating.toStringAsFixed(1);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(26, 5.5, 30.6, 8.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Penilaian Produk',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: 0.2,
                  color: const Color(0xFF575859),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    formattedRating,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      height: 1.2,
                      color: const Color(0xFF797979),
                    ),
                  ),
                  const SizedBox(width: 6.2),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 12,
                  ),
                  const SizedBox(width: 6.2),
                  Text(
                    '${product.totalReviews > 0 ? '(${product.totalReviews} Reviews)' : ('0 Reviews')}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      height: 1.2,
                      color: const Color(0xFF797979),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 6.0,
                    color: Color(0xff797979),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${product.totalReviews > 0 ? '${product.totalReviews} Ulasan' : ('0 Ulasan')}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      height: 1.2,
                      color: const Color(0xFF797979),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                Review(
                  product: product,
                  productId: product.id,
                ),
                binding: ReviewBinding(product.id),
              );
            },
            child: Text(
              'Lihat semua >',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 2,
                letterSpacing: 0.2,
                color: const Color(0xFF980019),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleReview(List<LatestReview> reviews) {
    if (reviews.isEmpty) {
      return Container(
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Divider(
              color: Color(0xffEEF1FF),
              thickness: 5,
            ),
          ],
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16.5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: review.userImageUrl != null
                          ? NetworkImage(review.userImageUrl!)
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
                          const SizedBox(height: 8),
                          Text(
                            review.review,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              height: 1.5,
                              letterSpacing: 0.2,
                              color: const Color(0xB267727E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffEEF1FF),
                thickness: 5,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavigation(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    controller.fetchSizes(varian);

    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xffC00C25),
              ),
              child: const Icon(
                Icons.share,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 1),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: Get.context!,
                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      height: 390,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(produk.imageUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    product.name.length <= 12
                                        ? product.name
                                        : '${product.name.substring(0, 12)}...',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28,
                                      height: 1.3,
                                      color: const Color(0xFF980019),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Text(
                                        'IDR ${product.originalPrice}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          height: 0.8,
                                          color: const Color(0xFF797979),
                                          decorationColor:
                                              const Color(0xFF797979),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'IDR ${product.discountPrice}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          height: 0.8,
                                          color: const Color(0xFFC00C25),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Obx(() {
                                    return Row(
                                      children: [
                                        Text(
                                          'Stock: ${controller.selectedStock}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: const Color(0xFF5D5F5F),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GetBuilder<ProductController>(
                            builder: (controller) => SizeSelector(
                              sizes: controller.sizes,
                              onButtonTap: (index) => controller.handlsizeTap(
                                  index,
                                  varian), // Use closure to pass variants
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jumlah',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    height: 0.8,
                                    color: const Color(0xFF797979),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.decrement(produk);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffF5F5F5),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: Color(0xff980019)),
                                        )),
                                      ),
                                    ),
                                    Obx(() => Container(
                                          height: 32,
                                          width: 26,
                                          decoration: const BoxDecoration(
                                            border: Border.symmetric(
                                              horizontal: BorderSide(
                                                  color: Color(0xffF5F5F5)),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${product.quantity.value}',
                                              style: const TextStyle(
                                                  color: Color(0xff980019)),
                                            ),
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        controller.increment(produk);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffF5F5F5)),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: Color(0xff980019)),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              controller.addToCart(produk);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff980019),
                              minimumSize: const Size(398, 40),
                              padding: const EdgeInsets.all(18),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(6), // Rounded corners
                              ),
                            ),
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                );
                              } else {
                                return Text(
                                  'Masukkan Ke Keranjang',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 0.8,
                                    color: const Color(0xFFffffff),
                                  ),
                                );
                              }
                            }),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xffC00C25),
                ),
                child: const Icon(
                  Icons.add_shopping_cart,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: Get.context!,
                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      height: 390,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(produk.imageUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    product.name.length <= 12
                                        ? product.name
                                        : '${product.name.substring(0, 12)}...',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28,
                                      height: 1.3,
                                      color: const Color(0xFF980019),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Text(
                                        'IDR ${product.originalPrice}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          height: 0.8,
                                          color: const Color(0xFF797979),
                                          decorationColor:
                                              const Color(0xFF797979),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'IDR ${product.discountPrice}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          height: 0.8,
                                          color: const Color(0xFFC00C25),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Obx(() {
                                    return Row(
                                      children: [
                                        Text(
                                          'Stock: ${controller.selectedStock}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: const Color(0xFF5D5F5F),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GetBuilder<ProductController>(
                            builder: (controller) => SizeSelector(
                              sizes: controller.sizes,
                              onButtonTap: (index) => controller.handlsizeTap(
                                  index,
                                  varian), // Use closure to pass variants
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jumlah',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    height: 0.8,
                                    color: const Color(0xFF797979),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.decrement(produk);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffF5F5F5),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: Color(0xff980019)),
                                        )),
                                      ),
                                    ),
                                    Obx(() => Container(
                                          height: 32,
                                          width: 26,
                                          decoration: const BoxDecoration(
                                            border: Border.symmetric(
                                              horizontal: BorderSide(
                                                  color: Color(0xffF5F5F5)),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${product.quantity.value}',
                                              style: const TextStyle(
                                                  color: Color(0xff980019)),
                                            ),
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        controller.increment(produk);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffF5F5F5)),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: Color(0xff980019)),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              controller.isLoading.value = true;
                              controller.buyNow(produk);
                              controller.isLoading.value = false;
                              CheckoutProductController checkoutController =
                                  CheckoutProductController();
                              Get.to(() => CheckOutProduct(
                                  payment: checkoutController.payment.first));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff980019),
                              minimumSize: const Size(398, 40),
                              padding: const EdgeInsets.all(18),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(6), // Rounded corners
                              ),
                            ),
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                );
                              } else {
                                return Text(
                                  'Beli Sekarang',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 0.8,
                                    color: const Color(0xFFffffff),
                                  ),
                                );
                              }
                            }),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(2, 0),
                    ),
                  ],
                  color: const Color(0xffffffff),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Beli Sekarang",
                    style: TextStyle(color: Color(0xffC00C25), fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.0,
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: IconButton(
              onPressed: () {
                Get.to(CartView());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 26.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffEEF1FF),
          child: Column(
            children: [
              _buildAppBar(product),
              const SizedBox(
                height: 7,
              ),
              _buildProductDetails(),
              const SizedBox(
                height: 7,
              ),
              _buildDescription(),
              const SizedBox(
                height: 7,
              ),
              _buildReview(),
              const SizedBox(
                height: 5,
              ),
              _buildSingleReview(review),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigation(context),
    );
  }
}
