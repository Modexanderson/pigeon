import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/constants.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    Color? textColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryDarkColor
        : kPrimaryLightColor;
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/account.svg',
            color: fillColor,
            width: 45.w,
            height: 56.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          const Text('Hesabınızı Silmek İstediğinize Emin Misiniz?'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      
      actions: <Widget>[
        SizedBox(
          width: 70.w,
          height: 35.h,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Return true when delete button is pressed
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(kPrimaryLightColor),
                backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.w), // Adjust the value as needed
                  ),
                ),
              ),
              child: const Text(
                'Evet',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
        SizedBox(
          width: 70.w,
          height: 35.h,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false when cancel button is pressed
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(textColor),
                backgroundColor: MaterialStateProperty.all<Color>(fillColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.w), // Adjust the value as needed
                  ),
                ),
              ),
              child: const Text(
                'Hayır',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
      ],
    );
  }
}
