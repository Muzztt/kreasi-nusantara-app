import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/opsi_pengiriman_card.dart';
import '../controllers/opsi_pengiriman_controller.dart';

class OpsiPengiriman extends GetView<OpsiPengirimanController> {
  const OpsiPengiriman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "Pengiriman",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: const [],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          itemCount: controller.shipping.length,
          itemBuilder: (context, index) {
            final shipping = controller.shipping[index];
            return GestureDetector(
              onTap: () {
                controller.selectShipping(shipping);
              },
              child: Obx(() => Container(
                    child: Column(
                      children: [
                        ShippingOption(
                          kurir: controller.shipping[index].kurir,
                          estimate: controller.shipping[index].estimate,
                          price: controller.shipping[index].price,
                          isSelected:
                              controller.selectedShipping.value == shipping,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _confirmShipping();
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
                'Konfirmasi',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 0.8,
                  color: const Color(0xFFffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmShipping() {
    var selectedShipping = controller.selectedShipping.value;
    if (selectedShipping != null) {
      Get.back(result: {
        'kurir': selectedShipping.kurir,
        'price': selectedShipping.price
      });
    } else {
      Get.snackbar('Error', 'Pilih opsi pengiriman terlebih dahulu');
    }
  }
}
