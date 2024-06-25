import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QButton2 extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final double? fontSize;

  final double? height;
  final Color? colorButton;

  const QButton2({
    super.key,
    required this.label,
    required this.onPressed,
    this.colorButton,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              4.0,
            ),
          ),
          backgroundColor: colorButton ?? primaryColor,
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 10,
          ),
        ),
      ),
    );
  }
}
