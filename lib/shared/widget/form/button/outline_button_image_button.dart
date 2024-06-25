import 'package:flutter/material.dart';

import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QOutlineImageButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final String? image;

  final Color? color;
  const QOutlineImageButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            4.0,
          )),
          foregroundColor: color,
          side: BorderSide(
            color: disabledColor,
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/google.png",
              width: 20.0,
              height: 20.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
