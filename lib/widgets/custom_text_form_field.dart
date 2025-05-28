import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    Color? textColor = fillColor == kPrimaryDarkColor
        ? kPrimaryLightColor // Use white text for dark fill color
        : kPrimaryDarkColor;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(color: kSecondaryColor),
        // labelText: labelText,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h, // Adjust the vertical padding using screenutil
          horizontal: 20.w, // Adjust the horizontal padding using screenutil
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w), // Adjust the border radius using screenutil
        ),
      ),
      style: TextStyle(color: textColor),
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}

