import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QNumberField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;

  const QNumberField({
    super.key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.onSubmitted,
    this.pattern,
    this.locale = "en_US",
  });

  @override
  State<QNumberField> createState() => _QNumberFieldState();
}

class _QNumberFieldState extends State<QNumberField> {
  String? value;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    value = widget.value?.replaceAll(RegExp(r'[^0-9.]'), '');
    controller = TextEditingController();
    controller.text = formattedValue?.toString() ?? "";
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      var pValue = num.tryParse(value.toString()) ?? 0;
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            validator: widget.validator,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: widget.hint,
              helperText: widget.helper,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: primaryColor, width: 2.0),
              ),
            ),
            onChanged: (newValue) {
              var newValue = controller.text;
              value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');
              controller.text = formattedValue ?? "";
              controller.selection =
                  TextSelection.collapsed(offset: controller.text.length);
              widget.onChanged(newValue.replaceAll(RegExp(r'\D'), ''));
            },
            onFieldSubmitted: (newValue) {
              var newValue = controller.text;
              value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');
              controller.text = formattedValue ?? "";
              controller.selection =
                  TextSelection.collapsed(offset: controller.text.length);
              if (widget.onSubmitted != null) {
                widget.onSubmitted!(newValue.replaceAll(RegExp(r'\D'), ''));
              }
            },
          ),
        ],

      ),
    );
  }
}
