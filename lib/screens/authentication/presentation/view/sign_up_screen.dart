import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/constants.dart';
import '../../../../widgets/social_button.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/sign_up_form.dart';
import './sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    Color? textColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryDarkColor
        : kPrimaryLightColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/Logo.svg', color: fillColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Hoşgeldin',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text('Hesap Oluştur'),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        logo: AnyLogo.tech.google,
                        label: 'Google',
                      ),
                      SizedBox(width: 20.w),
                      SocialButton(
                        logo: AnyLogo.media.facebook,
                        label: 'Facebook',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(thickness: 3),
                  SizedBox(height: 20.h),
                  const SignUpForm(),
                  SizedBox(height: 20.h),
                  Text(
                    'Zaten Hesabin Var Mi ?',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    text: 'Giriş Yap',
                    color: fillColor,
                    textColor: textColor,
                    width: MediaQuery.of(context).size.width / 1.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
