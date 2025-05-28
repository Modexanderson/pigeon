import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigeon/screens/contact_us/contact_us_screen.dart';
import 'package:pigeon/screens/privacy_policy/privacy_policy_screen.dart';

import '../../models/constants.dart';
import '../../widgets/title_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleText(),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    'Hakkımızda',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
                const Divider(),
                const Divider(),
                ListTile(
                  leading: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/contact.svg',
                      color: fillColor,
                      width: 24.14.w,
                      height: 24.h,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    'İletişim',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                ),
                const Divider(),
                const Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                      'assets/icons/hand_icon.svg',
                      color: fillColor,
                      width: 30.w,
                      height: 30.h,
                    ),
                  title: Text(
                    'Gizlilik Sözleşmesi',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                  },
                ),
                const Divider(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 20.w),
                  child: Text(
                    'Bizi Takip Edin',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 20.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/at_icon.svg',
                        color: fillColor,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/X_icon.svg',
                        color: fillColor,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/instagram_icon.svg',
                        color: fillColor,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/telegram_icon.svg',
                        color: fillColor,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/whatsapp_icon.svg',
                        color: fillColor,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
