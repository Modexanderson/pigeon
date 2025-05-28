import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kTitle = 'PIGEON';
const kPrimaryColor = Color(0xFFEFB45C);
const kAuthorTextColor = Color(0xFF55A197);

const kPrimaryLightColor = Colors.white;
const kPrimaryDarkColor = Color(0xFF18191E);
const kPrimaryDarkAccentColor = Colors.grey;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.blueAccent, Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kCurrnecyRiseColor = Colors.green;
const kCurrnecyFallColor = Colors.red;

const kAnimationDuration = Duration(milliseconds: 200);

double get screenPadding => 10.w;

final headingStyle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  height: 1.5,
);
final smallTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

final authorTextStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  color: kAuthorTextColor,
);

const defaultDuration = Duration(milliseconds: 250);

class AppStrings {
  static String getNameNullError(BuildContext context) {
    return 'Adınızı girin';
  }
  static String getInvalidNameError(BuildContext context) {
    return 'Geçerli bir ad girin';
  }
  static String getEmailNullError(BuildContext context) {
    return 'E-posta adresinizi girin';
  }
  static String getInvalidEmailError(BuildContext context) {
    return 'Geçerli e-posta girin';
  }

  static String getPhoneNullError(BuildContext context) {
    return 'Telefonunuzu girin';
  }

  static String getPassNullError(BuildContext context) {
    return 'Şifrenizi girin';
  }

  static String getShortPassError(BuildContext context) {
    return 'Şifre çok kısa';
  }

  static String getMatchPassError(BuildContext context) {
    return "Şifreler eşleşmiyor";
  }

  static String getFieldRequiredMessage(BuildContext context) {
    return 'Bu alanın doldurulması zorunludur';
  }
}

final emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: 15.h),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.w),
    borderSide: const BorderSide(color: Colors.grey),
  );
}
