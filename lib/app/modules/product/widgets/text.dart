import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const ReText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xff303030),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
