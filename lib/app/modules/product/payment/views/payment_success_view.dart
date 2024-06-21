import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/payment.dart';
import '../controllers/payment_success_controller.dart';

class PyamentSuccess extends GetView<PaymentSuccessController> {
  final Paymentwidget payment;
  final int subtotal;

  PyamentSuccess({Key? key, required this.payment, required this.subtotal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          backgroundColor: const Color(0xffC00C25),
          title: const Text(
            "Checkout",
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            // SvgPicture.asset(
            //   'assets/svg/Success.svg',
            //   width: 263, // sesuaikan dengan kebutuhan
            //   height: 263,
            // ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/svg/success.png",
                      width: 263,
                      height: 263,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Text(
                      "Payment Successful",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF20BE79),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
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
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Summary Order",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xFF1B1C20),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
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
            SizedBox(
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
      bottomNavigationBar: _buildCo(controller),
    );
  }
}

Widget _buildCo(PaymentSuccessController controller) {
  return Container(
    height: 120,
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffC00C25),
                minimumSize: const Size(398, 56),
                padding: const EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Kembali Ke Beraanda',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 0.8,
                    color: const Color(0xFFffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
