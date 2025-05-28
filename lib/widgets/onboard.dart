import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigeon/models/constants.dart';
import 'package:pigeon/screens/authentication/presentation/view/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home/home_screen.dart';
import 'custom_button.dart';

class OnBoard extends StatelessWidget {
  final String urlImage;
  final String title;
  final String subtitle;
  final String footText;
  final bool isLastPage;

  const OnBoard(
      {required this.urlImage,
      required this.title,
      required this.subtitle,
      required this.footText,
      required this.isLastPage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black87],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: kPrimaryLightColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                if (isLastPage)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CustomButton(
                        text: 'Giriş Yap',
                        height: 39,
                        color: kPrimaryLightColor,
                        textColor: kPrimaryDarkColor,
                        width: 245.w,
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: ((context) => const SignInScreen()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  
                Text(
                  footText,
                  style: const TextStyle(
                      color: kPrimaryLightColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
