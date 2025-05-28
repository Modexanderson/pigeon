import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/constants.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';
import 'no_account_text.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();

  @override
  void dispose() {
    emailFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 30.h), // Adjusting height with screenutil
          buildEmailFormField(),
          SizedBox(height: 30.h), // Adjusting height with screenutil
          CustomButton(
            text: 'Doğrulama e-postasını gönderin',
            onPressed: () {},
          ),
          SizedBox(height: 30.h), // Adjusting height with screenutil
          const NoAccountText(),
          SizedBox(height: 30.h), // Adjusting height with screenutil
        ],
      ),
    );
  }

  CustomTextFormField buildEmailFormField() {
    return CustomTextFormField(
      controller: emailFieldController,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
      suffixIcon: const Icon(
        Icons.mail_outline,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.getEmailNullError(context);
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return AppStrings.getInvalidEmailError(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
