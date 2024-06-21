import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final double? height;

  const CustomBottomSheet({
    super.key,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: child,
    );
  }
}
