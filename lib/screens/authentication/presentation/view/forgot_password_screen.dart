import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../../models/constants.dart';
import '../../../../../../widgets/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/Logo.svg', color: color,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w, // Assuming you're using screenutil for width
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 40.h), // Adjusting height with screenutil
                  Text(
                    'Şifreni mi unuttun?',
                    style: headingStyle,
                  ),
                  SizedBox(height: 10.h), // Adjusting height with screenutil
                  const Text(
                    'Hesabınıza bağlı e-posta adresini lütfen girin',
                  ),
                  const ForgotPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
