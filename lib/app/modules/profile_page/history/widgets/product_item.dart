import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../rincian_pembelian_product/views/rincian_pembelian_product_view.dart';

class ProductItem extends StatelessWidget {
  final Map<String, dynamic>? product;

  const ProductItem({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const SizedBox(); // Placeholder widget or error handling
    }

    final String? image = product!['image'];
    final String? title = product!['title'];
    final String? color = product!['color'];
    final String? size = product!['size'];
    final int? price = product!['price'];

    return GestureDetector(
      onTap: () {
        Get.to(const RincianPembelianProductView());
      },
      child: Container(
        width: 430,
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                image ??
                    'assets/default_image.png', // Default image path if null
                fit: BoxFit.cover,
                width: 169,
                height: 120,
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      title ?? 'Untitled', // Default title if null
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '${color ?? ''}, ${size ?? ''}', // Color and size of the product
                            style: const TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '1x', // Quantity
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Total Pesanan: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: 'IDR ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFF980019), // Colored IDR
                                ),
                              ),
                              TextSpan(
                                text: '${price ?? 0}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFF980019),
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to ProductDetailView
                          Get.to(const RincianPembelianProductView());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color(0xFF980019), // Button color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Beli Lagi',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
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
