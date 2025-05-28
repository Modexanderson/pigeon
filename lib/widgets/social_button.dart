import 'package:flutter/material.dart';
import 'package:flutter_any_logo/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/constants.dart';
import '../models/size_config.dart';

class SocialButton extends StatelessWidget {
  final AssetGenImage logo;
  final String label;

  const SocialButton({
    required this.logo,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? selectedColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 43.h, // Adjust height using screenutil
        padding: EdgeInsets.all(10.w), // Adjust padding using screenutil
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: selectedColor),
          borderRadius: BorderRadius.circular(
              10.w), // Adjust border radius using screenutil
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(logo.path),
              width: 50.w, // Adjust width using screenutil
            ),
            SizedBox(width: 10.w), // Adjust width using screenutil
            Text(
              label,
            ),
          ],
        ),
      ),
    );
  }
}
