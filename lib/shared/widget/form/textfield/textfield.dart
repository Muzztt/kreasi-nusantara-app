import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  const QTextField({
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
    this.focusNode,
    this.controller,
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
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  late TextEditingController textEditingController;
  bool visible = false;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    textEditingController = widget.controller ?? TextEditingController();
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
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

  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      widget.suffixIcon ?? Icons.abc,
    );

    if (widget.obscure) {
      if (visible) {
        icon = InkWell(
          onTap: () {
            setState(() {
              visible = false;
            });
          },
          child: const Icon(Icons.visibility),
        );
      } else {
        icon = InkWell(
          onTap: () {
            setState(() {
              visible = true;
            });
          },
          child: const Icon(Icons.visibility_off),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: TextFormField(
            enabled: widget.enabled,
            controller: textEditingController,
            focusNode: focusNode,
            validator: widget.validator,
            maxLength: widget.maxLength,
            obscureText: visible == false && widget.obscure,
            decoration: InputDecoration(
              helperText: widget.helper,
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            onFieldSubmitted: (value) {
              if (widget.onSubmitted != null) widget.onSubmitted!(value);
            },
          ),
        ),
      ],
    );
  }
}
