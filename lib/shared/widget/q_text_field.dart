// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QTextField extends StatefulWidget {
  const QTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    // required this.validator,
    this.isObscure = false,
    this.isEnable = true,
    this.value,
    required this.onChanged,
    this.isNumberOnly,
    this.isPhoneNumber,
    this.errorText,
    this.maxLines,
  });

  final int? maxLines;
  final String? hintText;
  final bool? isNumberOnly;
  final bool? isPhoneNumber;
  final bool? isEnable;
  final bool? isObscure;
  final String? value;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  // final String? Function(String?)? validator;
  final Function(String) onChanged;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  bool visible = false;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.value ?? "");
  }

  @override
  void didUpdateWidget(QTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != null && widget.value != oldWidget.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        textEditingController.text = widget.value!;
      });
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      visible ? Icons.visibility_off : Icons.visibility,
      color: Colors.white.withAlpha(100),
    );

    if (widget.isObscure!) {
      if (visible) {
        icon = InkWell(
          onTap: () {
            setState(() {
              visible = false;
            });
          },
          child: icon,
        );
      } else {
        icon = InkWell(
          onTap: () {
            setState(() {
              visible = true;
            });
          },
          child: icon,
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10),
        ],
      ),
      child: TextFormField(
        controller: textEditingController,
        enabled: widget.isEnable,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "SF Pro Display",
        ),
        keyboardType: widget.isNumberOnly ?? false
            ? TextInputType.number
            : widget.isPhoneNumber ?? false
            ? TextInputType.number
            : null,

        obscureText: visible == false && widget.isObscure!,
        validator: null,
        maxLines: widget.maxLines,
        onChanged: (value) => widget.onChanged(value),
        decoration: InputDecoration(
          errorText: widget.errorText,
          errorMaxLines: 2,
          hintText: widget.hintText,

          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: Colors.white)
              : null,

          suffixIcon: widget.isObscure!
              ? icon
              : widget.suffixIcon != null
              ? Icon(widget.suffixIcon)
              : null,
        ),
      ),
    );
  }
}
