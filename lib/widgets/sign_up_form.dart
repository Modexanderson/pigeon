// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/constants.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController phoneFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController confirmPasswordFieldController =
      TextEditingController();

  @override
  void dispose() {
    nameFieldController.dispose();
    emailFieldController.dispose();
    phoneFieldController.dispose();
    passwordFieldController.dispose();
    confirmPasswordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: 10.h),
          buildEmailFormField(),
          SizedBox(height: 10.h),
          buildPhoneFormField(),
          SizedBox(height: 10.h),
          buildPasswordFormField(),
          SizedBox(height: 10.h),
          buildConfirmPasswordFormField(),
          SizedBox(height: 40.h),
          CustomButton(
            text: 'Üye Ol',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildNameFormField() {
    return CustomTextFormField(
      controller: nameFieldController,
      keyboardType: TextInputType.name,
      hintText: 'Ad Soyad',
      suffixIcon: const Icon(Icons.text_fields),
      validator: (value) {
        if (nameFieldController.text.isEmpty) {
          return AppStrings.getNameNullError(context);
        } else if (!emailValidatorRegExp.hasMatch(nameFieldController.text)) {
          return AppStrings.getInvalidNameError(context);
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
      suffixIcon: const Icon(Icons.mail_outline),
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

  Widget buildPhoneFormField() {
    return CustomTextFormField(
      controller: phoneFieldController,
      keyboardType: TextInputType.phone,
      hintText: 'Telefon',
      suffixIcon: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.phone_outlined),
      ),
      validator: (value) {
        if (phoneFieldController.text.isEmpty) {
          return AppStrings.getPhoneNullError(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildConfirmPasswordFormField() {
    return CustomTextFormField(
      controller: confirmPasswordFieldController,
      obscureText: !isPasswordVisible,
      hintText: 'Şifreyi doğrulayın',
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
        if (confirmPasswordFieldController.text.isEmpty) {
          return AppStrings.getPassNullError(context);
        } else if (confirmPasswordFieldController.text !=
            passwordFieldController.text) {
          return AppStrings.getMatchPassError(context);
        } else if (confirmPasswordFieldController.text.length < 8) {
          return AppStrings.getShortPassError(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
