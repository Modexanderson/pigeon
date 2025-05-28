
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigeon/models/constants.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Function onPressed;

  const CustomButton({
    required this.text,
    this.width,
    this.height,
    this.color,
    this.textColor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h, // Adjust the height using screenutil
      child: ElevatedButton(
        onPressed: () {
          onPressed();
          // Implement edit profile functionality
        },
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(textColor ?? kPrimaryLightColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.w), // Adjust the value as needed
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp), // Adjust the font size using screenutil
        ),
      ),
    );
  }
}
