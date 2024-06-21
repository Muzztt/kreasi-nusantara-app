import 'package:flutter/material.dart';

class ReTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const ReTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color(0xff303030)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: const Color(0xff303030),
            fontWeight: FontWeight.w300,
            fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff303030)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      controller: controller,
      obscureText: obscureText,
      maxLength: maxLength,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
