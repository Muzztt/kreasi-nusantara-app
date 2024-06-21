
import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
class QButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;

  final double? height;
  final Color? colorButton;

  const QButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.colorButton,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 47,
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
        child: Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
