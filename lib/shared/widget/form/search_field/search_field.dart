import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QSearchField extends StatefulWidget {
  const QSearchField({
    required this.label,
    required this.onChanged,
    super.key,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  @override
  State<QSearchField> createState() => _QSearchFieldState();
}

class _QSearchFieldState extends State<QSearchField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6.0, // Smaller bottom margin
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle:
              const TextStyle(fontSize: 14.0), // Smaller label font size
          prefixIcon: Icon(
            widget.prefixIcon ?? Icons.search,
            color: iconColor,
            size: 20.0, // Smaller icon size
          ),
          helperText: widget.helper,
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 12.0), // Smaller hint font size
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: secondaryTextColor,
              width: 1.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, // Reduced vertical padding
            horizontal: 12.0, // Reduced horizontal padding
          ),
        ),
        style: const TextStyle(fontSize: 14.0), // Smaller text font size
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
