import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'card_product.dart';

class ChartCard extends StatelessWidget {
  final ProductCard product;
  const ChartCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Obx(
            () => Checkbox(
              value: product.isChecked.value,
              onChanged: (value) {
                controller.toggleCheckbox(product, value ?? false);
              },
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            width: 74,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                product.productName.length <= 12
                    ? product.productName
                    : '${product.productName.substring(0, 12)}...',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 1.3,
                  color: const Color(0xFF980019),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Text(
                    'IDR ${product.originalPrice}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      height: 0.8,
                      color: const Color(0xFF797979),
                      decorationColor: const Color(0xFF797979),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'IDR ${product.discountedPrice}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 0.8,
                      color: const Color(0xFFC00C25),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'XL',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 0.8,
                  color: const Color(0xFF797979),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.decrement(product);
                },
                child: Container(
                  height: 32,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 199, 199, 199),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    "-",
                    style: TextStyle(color: Color(0xff980019)),
                  )),
                ),
              ),
              Obx(() => Container(
                    height: 32,
                    width: 26,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color.fromARGB(255, 199, 199, 199),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${product.quantity.value}',
                        style: const TextStyle(color: Color(0xff980019)),
                      ),
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  controller.increment(product);
                },
                child: Container(
                  height: 32,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 199, 199, 199),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    "+",
                    style: TextStyle(color: Color(0xff980019)),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
