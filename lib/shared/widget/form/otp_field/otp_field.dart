import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class QOtpField extends StatefulWidget {
  const QOtpField({
    required this.length,
    required this.onChanged,
    super.key,
    this.obscure = false,
    this.enabled = true,
    this.controller,
    this.focusNodes,
  });

  final int length;
  final bool obscure;
  final bool enabled;
  final Function(String) onChanged;
  final List<TextEditingController>? controller;
  final List<FocusNode>? focusNodes;

  @override
  State<QOtpField> createState() => _QOtpFieldState();
}

class _QOtpFieldState extends State<QOtpField> {
  late List<TextEditingController> textControllers;
  late List<FocusNode> focusNodes;
  late List<String> otpValues;

  @override
  void initState() {
    super.initState();
    textControllers = widget.controller ??
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes = widget.focusNodes ??
        List.generate(widget.length, (index) => FocusNode());
    otpValues = List.generate(widget.length, (index) => '');
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      for (var controller in textControllers) {
        controller.dispose();
      }
    }
    if (widget.focusNodes == null) {
      for (var focusNode in focusNodes) {
        focusNode.dispose();
      }
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    setState(() {
      otpValues[index] = value;
    });
    String otp = otpValues.join('');
    widget.onChanged(otp);

    if (value.length == 1 && index < widget.length - 1) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 65,
          child: TextFormField(
            enabled: widget.enabled,
            controller: textControllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
            obscureText: widget.obscure,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
