import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/event_page/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/views/alamat_view.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/controllers/product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/opsi_pengiriman/views/opsi_pengiriman_view.dart';
import 'package:kreasi_nusantara/app/modules/product/payment/views/payment_success_view.dart';

import '../../widgets/card_product.dart';
import '../../widgets/cart_crad.dart';
import '../../widgets/payment.dart';

class CheckOutProduct extends GetView<ProductController> {
  final Paymentwidget payment;

  CheckoutProductController co = Get.put(CheckoutProductController());

  CheckOutProduct({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Checkout",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                co.getAddressById();
              },
              icon: const Icon(
                Icons.refresh,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  height: 148,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(ChangeAddress())?.then((value) {
                                // Fungsi ini akan dijalankan setelah pengguna kembali dari ChangeAddress
                                co.getAddressById(); // Memperbarui alamat setelah pengguna kembali
                              });
                            },
                            child: Text(
                              'Ganti Alamat',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color(0xff980019),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    '${selectedAddress.phone}',
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
                              Text(
                                '${selectedAddress.street}, ${selectedAddress.city}, ${selectedAddress.province} ${selectedAddress.zipCode}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tampilkan Detail Alamat',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: const Color(0xff980019),
                                ),
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
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            //ambil yang di check di halaman cart
            Container(
              color: Colors.white,
              child: Obx(() {
                List<ProductCard> checkedItems = controller.getCheckedItems();
                if (checkedItems.isEmpty) {
                  return const Center(
                    child: Text(
                      'Your cart is empty!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                } else {
                  return Column(
                    children: checkedItems.map((product) {
                      return ChartCard(product: product);
                    }).toList(),
                  );
                }
              }),
            ),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<CheckoutProductController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () async {
                    var selectedShipping = await Get.to(OpsiPengiriman());
                    if (selectedShipping != null) {
                      controller.setSelectedCourier(selectedShipping['kurir'],
                          int.parse(selectedShipping['price']));
                      // Panggil update dari controller untuk memperbarui UI
                      controller.update();
                    }
                  },
                  child: Container(
                    height: 72,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6FDFC).withOpacity(0.3),
                      border: const Border.symmetric(
                        horizontal:
                            BorderSide(width: 2, color: Color(0xffF6FDFC)),
                        vertical: BorderSide(width: 0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kurir',
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
                                size: 26.0,
                                color: Color(0xfffA6DCD5),
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
            Expanded(
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.payment.length,
                itemBuilder: (context, index) {
                  final payment = controller.payment[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: [
                        Paymentwidget(
                          paymentImage: payment.paymentImage,
                          paymentName: payment.paymentName,
                        ),
                        const SizedBox(height: 16), // Tambahkan jarak di sini
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildCo(controller, context),
    );
  }
}

Widget _buildCo(ProductController controller, BuildContext context) {
  return Container(
    height: 88,
    width: 430,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 1, // Blur radius
        offset: const Offset(0, -3), // Offset in the y direction
      ),
    ], color: Colors.white),
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
                  onPressed: () {
                    Get.to(PyamentSuccess(
                        payment: controller.payment.first,
                        subtotal: controller.totalPrice.value));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC00C25),
                    minimumSize: const Size(331, 40),
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Lanjut',
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
          ],
        ),
      ),
    ),
  );
}
