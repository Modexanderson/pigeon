// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';
import '../models/constants.dart';
import '../screens/authentication/presentation/view/forgot_password_screen.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  void dispose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 10.h),
          buildPasswordFormField(),
          SizedBox(
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(
                      value: rememberMe,
                      onChanged: (value) => setState(() => rememberMe = value),
                    ),
                    const Text('Beni Hatırla'),
                  ],
                ),
                buildForgotPasswordWidget(context),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          CustomButton(
            text: 'Giriş Yap',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildForgotPasswordWidget(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              );
            },
            child: const Text(
              'Şifremi Unuttum',
            ),
          )
        ],
      ),
    );
  }

  Widget buildPasswordFormField() {
    return CustomTextFormField(
      controller: passwordFieldController,
      obscureText: !isPasswordVisible,
      hintText: 'Şifre',
      suffixIcon: GestureDetector(
        onTap: () {
          // Toggle the visibility of the password
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        child: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
      ),
      validator: (value) {
        if (passwordFieldController.text.isEmpty) {
          return AppStrings.getPassNullError(context);
        } else if (passwordFieldController.text.length < 8) {
          return AppStrings.getShortPassError(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildEmailFormField() {
    return CustomTextFormField(
      controller: emailFieldController,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
      suffixIcon: const Icon(
        Icons.mail_outline,
      ),
      validator: (value) {
        if (emailFieldController.text.isEmpty) {
          return AppStrings.getEmailNullError(context);
        } else if (!emailValidatorRegExp.hasMatch(emailFieldController.text)) {
          return AppStrings.getInvalidEmailError(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
