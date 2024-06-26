import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/controllers/main_navigation_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/controllers/cart_controller.dart';

import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/views/alamat_view.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/opsi_pengiriman/views/opsi_pengiriman_view.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/order_item.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/payment.dart';

// ignore: must_be_immutable
class CheckOutProduct extends GetView<ProductController> {
  final Paymentwidget payment;
  final int subtotal;

  CheckoutProductController co = Get.put(CheckoutProductController());
  CartController cart = Get.put(CartController());

  CheckOutProduct({super.key, required this.payment, required this.subtotal});

  @override
  Widget build(BuildContext context) {
    MainNavigationController mainNavController =
        Get.find<MainNavigationController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Checkout",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          actions: const [],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 24.0,
                                  color: Color(0xff980019),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Alamat Pengiriman',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(() {
                              final selectedAddress = co.selectedAddress.value;
                              if (selectedAddress != null) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${selectedAddress.name},',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Container(
                                            width: 3,
                                            height: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          selectedAddress.phone,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width -
                                                160,
                                      ),
                                      child: Text(
                                        '${selectedAddress.street}, ${selectedAddress.city}, ${selectedAddress.province} ${selectedAddress.zipCode}',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                );
                              } else {
                                return const Text(
                                  'Belum ada alamat dipilih',
                                  style: TextStyle(fontSize: 14),
                                );
                              }
                            }),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const ChangeAddress())?.then((value) {
                              // Fungsi ini akan dijalankan setelah pengguna kembali dari ChangeAddress
                              co.getAddressById(); // Memperbarui alamat setelah pengguna kembali
                            });
                          },
                          child: Expanded(
                            child: Text(
                              'Ganti Alamat',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xff980019),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xffE3E3E3),
            ),
            const SizedBox(
              height: 8,
            ),
            //ambil yang di check di halaman cart
            Container(
              color: Colors.white,
              child: Obx(() {
                List<OrderItem> orderItems = cart.cartItems.map((cartItem) {
                  return OrderItem(
                    imageUrl: cartItem.productImage,
                    productName: cartItem.productName,
                    productDetails: 'Ukuran ${cartItem.size}',
                    quantity: cartItem.quantity.value,
                    totalPrice:
                        'IDR ${cartItem.discountPrice * cartItem.quantity.value}',
                  );
                }).toList();

                if (orderItems.isEmpty) {
                  return const Center(
                    child: Text(
                      'Cart masih kosong',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                } else {
                  return Column(
                    children: orderItems.map((orderItem) {
                      return Column(
                        children: [
                          orderItem,
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Color(0xffE3E3E3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }
              }),
            ),

            GetBuilder<CheckoutProductController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () async {
                    var selectedShipping = await Get.to(const OpsiPengiriman());
                    if (selectedShipping != null) {
                      controller.setSelectedCourier(selectedShipping['kurir'],
                          int.parse(selectedShipping['price']));
                      // Panggil update dari controller untuk memperbarui UI
                      controller.update();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0x0fffffff).withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pengiriman',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${controller.selectedCourier.value} (Rp.${controller.selectedPrice.value})',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 4), // Spasi antara teks dan ikon
                                  const Icon(
                                    Icons.navigate_next_outlined,
                                    size: 24.0,
                                    color: Color(0xff000000),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const Divider(
              thickness: 2,
              color: Color(0xffE3E3E3),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Payment Method',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xff1B1C20)),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.payment.length,
              itemBuilder: (context, index) {
                final payment = controller.payment[index];
                return Obx(() {
                  final isSelected =
                      controller.selectedPayment.value == payment;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: [
                        Paymentwidget(
                          paymentImage: payment.paymentImage,
                          paymentName: payment.paymentName,
                          isSelected: isSelected,
                          onTap: () {
                            controller.selectPayment(payment);
                          },
                        ),
                        const SizedBox(height: 16), // Add spacing
                      ],
                    ),
                  );
                });
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rincian Pembayaran',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff1B1C20)),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total Produk",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                      Text(
                        "Rp. $subtotal",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Pengiriman",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                      Text(
                        "Rp. 0",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                      Text(
                        " Rp. $subtotal",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color(0xFF1B1C20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildCo(mainNavController),
    );
  }
}

Widget _buildCo(MainNavigationController mainNavController) {
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    CheckoutProductController co =
                        Get.find<CheckoutProductController>();
                    if (co.selectedAddress.value == null) {
                      // Show Snackbar if address is not selected
                      Get.snackbar(
                        'Pilih Alamat',
                        'Anda belum memilih alamat pengiriman.',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return; // Stop further execution
                    }

                    if (co.selectedCourier.value.isEmpty) {
                      // Show Snackbar if shipping method is not selected
                      Get.snackbar(
                        'Pilih Pengiriman',
                        'Anda belum memilih metode pengiriman.',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return; // Stop further execution
                    }

                    CartController cart = Get.find<CartController>();
                    String? cartId = cart.getSelectedCartId();

                    if (cartId != null) {
                      // Get the snapUrl
                      String? snapUrl =
                          await cart.makeStaticTransaction(cartId);

                      // Check if snapUrl is not null before launching
                      if (snapUrl != null) {
                        print('Launching snapUrl: $snapUrl');
                        await launchUrlString(snapUrl);
                      } else {
                        print('Error: snapUrl is null');
                        // Handle the case where snapUrl cannot be obtained
                      }
                    } else {
                      print('Error: No cart item is selected');
                      // Handle the case where no cart item is selected
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff980019),
                    minimumSize: const Size(331, 40),
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 0.8,
                      color: const Color(0xFFffffff),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
