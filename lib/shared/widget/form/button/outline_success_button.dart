import 'package:flutter/material.dart';

import 'package:kreasi_nusantara/shared/theme/theme_config.dart';


class QOutlineSuccessButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  const QOutlineSuccessButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(
            color: primaryColor,
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
