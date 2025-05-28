import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/constants.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    Color? textColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryDarkColor
        : kPrimaryLightColor;
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Çevrimdışı İndirilmiş Haberiniz Bulunmamaktadır',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(
                  'assets/icons/offline.svg',
                  color: fillColor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Son 100 haberi indirerek internetiniz olmadan bile haberlere erişim sağlayabilirsiniz!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 144.w,
                  height: 61.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(textColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(fillColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.w), // Adjust the value as needed
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Şimdi Yükle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SvgPicture.asset('assets/icons/download.svg',
                              color: textColor),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
