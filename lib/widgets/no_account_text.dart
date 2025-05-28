import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigeon/widgets/custom_button.dart';

import '../models/constants.dart';
import '../screens/authentication/presentation/view/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    Color? textColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryDarkColor
        : kPrimaryLightColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hesabin Yok Mu ?',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),
        CustomButton(
          text: 'Üye Ol',
          width: MediaQuery.of(context).size.width / 1.5,
          color: fillColor,
          textColor: textColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
        ),
      ],
    );
  }
}
