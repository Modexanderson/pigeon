import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/constants.dart';
import '../../widgets/title_text.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleText(),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
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
                  title: Text(
                    'Ünvan:',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    'Pigeon Medya Reklam Habercilik ve Yayıncılık Ltd. Şti.',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
                const Divider(),
                const Divider(),
                ListTile(
                  title: Text(
                    'Telefon: ',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    '+90 (555) 555 55 55',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
                const Divider(),
                const Divider(),
                ListTile(
                  title: Text(
                    'E-Posta: ',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    'eposta@gmail.com',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
                const Divider(),
                const Divider(),
                ListTile(
                  title: Text(
                    'Adres: ',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    'Adres Mah. Adres Sk. No:26, Kadıköy / İstanbul',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
                const Divider(),
              ],
            )),
      ),
    );
  }
}
