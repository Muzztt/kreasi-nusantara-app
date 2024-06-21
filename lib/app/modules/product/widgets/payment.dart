import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paymentwidget extends StatelessWidget {
  final String paymentImage;
  final String paymentName;
  const Paymentwidget(
      {super.key, required this.paymentImage, required this.paymentName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.71,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 50,
              height: 35.71,
              child: Image.network(paymentImage),
            ),
          ),
          const SizedBox(width: 10),
          Text(paymentName),
        ],
      ),
    );
  }
}
