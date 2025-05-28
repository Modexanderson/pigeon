import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/constants.dart';
import '../../../../widgets/social_button.dart';
import '../../../../widgets/no_account_text.dart';
import '../../../../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/Logo.svg', color: color)
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 30.w),
          child: SingleChildScrollView(
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'Hoşgeldin',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  const Text('Hesabına Giriş Yap'),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(logo: AnyLogo.tech.google, label: 'Google'),
                      SizedBox(width: 20.sp),
                      SocialButton(
                          logo: AnyLogo.media.facebook, label: 'Facebook'),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Divider(thickness: 3.sp),
                  SizedBox(height: 20.sp),
                  const SignInForm(),
                  SizedBox(height: 20.sp),
                  const NoAccountText(),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
