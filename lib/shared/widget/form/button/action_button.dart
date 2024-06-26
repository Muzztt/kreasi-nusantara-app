import 'package:flutter/material.dart';

import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QActionButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double verticalPadding;
  final double horizontalPadding;

  const QActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.verticalPadding = 12.0,
    this.horizontalPadding = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(horizontalPadding, 50), // Atur lebar dan tinggi
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
