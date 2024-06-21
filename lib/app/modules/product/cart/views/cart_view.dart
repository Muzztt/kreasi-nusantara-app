import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/views/checkout_view.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/cart_crad.dart';

class CartView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0),
        child: AppBar(
          backgroundColor: Color(0xffC00C25),
          title: const Text(
            "Cart",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          actions: [],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Obx(
              () => Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 60, // Atur tinggi Container sesuai kebutuhan

                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height:
                                60, // Atur tinggi Container sesuai kebutuhan

                            child: Center(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: controller.areAllChecked(),
                                    onChanged: (value) =>
                                        controller.toggleAllCheckboxes(value!),
                                  ),
                                  Text(
                                    'Semua',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: const Color(0xFF980019),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...controller.cartItems.map((product) {
                    return Column(
                      children: [
                        ChartCard(product: product),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildCo(controller),
    );
  }
}

Widget _buildCo(ProductController controller) {
  return Container(
    height: 88,
    width: 430,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 1, // Blur radius
        offset: Offset(0, -3), // Offset in the y direction
      ),
    ], color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF000000),
              ),
            ),
            Obx(() => Text(
                  'IDR ${controller.totalPrice.value}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.3,
                    color: const Color(0xFF980019),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                Get.to(CheckOutProduct(payment: controller.payment.first));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffC00C25),
                minimumSize: const Size(147, 40),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text(
                'Bayar Sekarang',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 0.8,
                  color: const Color(0xFFffffff),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
