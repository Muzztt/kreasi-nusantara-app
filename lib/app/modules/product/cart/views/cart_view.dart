import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/views/checkout_view.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/controllers/cart_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/cart_crad.dart';

class CartView extends GetView<CartController> {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            "Keranjang",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          actions: const [],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Obx(
              () => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    height: 60,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      bool newValue =
                                          !controller.areAllChecked();
                                      controller.toggleAllCheckboxes(newValue);
                                    },
                                    child: Checkbox(
                                      value: controller.areAllChecked(),
                                      onChanged: (value) {
                                        bool newValue = value ?? false;
                                        controller
                                            .toggleAllCheckboxes(newValue);
                                      },
                                    ),
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
                  if (controller.cartItems.isEmpty)
                    const Center(
                      child: Text('No items in the cart'),
                    )
                  else
                    ...controller.cartItems.map((cartItem) {
                      return Column(
                        children: [
                          ChartCard(cartItem: cartItem),
                        ],
                      );
                    }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildCo(controller),
    );
  }

  Widget _buildCo(CartController controller) {
    return Container(
      height: 88,
      width: 430,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -3),
          ),
        ],
        color: Colors.white,
      ),
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
                  ProductController product = Get.put(ProductController());
                  Get.to(CheckOutProduct(
                    payment: product.payment.first,
                    subtotal: controller.totalPrice.value,
                  ))!
                      .then((value) {
                    controller
                        .reloadCartItems(); // Memanggil reloadCartItems setelah kembali dari CheckOutProduct
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC00C25),
                  minimumSize: const Size(147, 40),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
}
