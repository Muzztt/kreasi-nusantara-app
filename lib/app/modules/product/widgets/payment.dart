import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paymentwidget extends StatelessWidget {
  final String paymentImage;
  final String paymentName;
  final bool isSelected;
  final VoidCallback onTap;

  const Paymentwidget({
    super.key,
    required this.paymentImage,
    required this.paymentName,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.71,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: isSelected ? const Color(0xff980019) : Colors.transparent,
              width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 50,
                height: 35.71,
                child: Image.network(paymentImage),
              ),
            ),
            const SizedBox(width: 10),
            Text(paymentName),
          ],
        ),
      ),
    );
  }
}
