import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingOption extends StatelessWidget {
  final String kurir;
  final String price;
  final String estimate;
  final bool isSelected;

  const ShippingOption({
    super.key, // Perbaiki parameter Key? key di sini
    required this.kurir,
    required this.price,
    required this.estimate,
    this.isSelected = false,
  }); // Perbaiki pemanggilan super() di sini

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: 430,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffffffff) : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  kurir,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isSelected
                        ? const Color(0xFF980019)
                        : const Color(0xFF5D5F5F),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  ' (Rp.$price)',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: isSelected
                        ? const Color(0xFF980019)
                        : const Color(0xFF5D5F5F),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Garansi Tiba $estimate',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: const Color(0xFF5D5F5F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
