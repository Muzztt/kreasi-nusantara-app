import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';

import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/success.png",
                      width: 240,
                      height: 240,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 19),
                    Text(
                      "Payment Successful",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF20BE79),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      "Your payment has been processed!",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFF828282),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Summary Order",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xFF1B1C20),
                ),
              ),
              const SizedBox(height: 16),
              _buildSummaryRow("Sub Total", "Rp. 75.000"),
              const SizedBox(height: 10),
              _buildSummaryRow("Admin Fee", "Rp. 5.000"),
              const SizedBox(height: 10),
              _buildSummaryRow("Total", "Rp. 80.000", isBold: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12.0),
        child: QActionButton(
          label: "Kembali Ke Beranda",
          onPressed: () => Get.to(const MainNavigationView()),
          verticalPadding: 10.0, // Atur padding vertikal
          horizontalPadding: 300.0,
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
            fontSize: 12,
            color: const Color(0xFF1B1C20),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
            fontSize: 12,
            color: const Color(0xFF1B1C20),
          ),
        ),
      ],
    );
  }
}
