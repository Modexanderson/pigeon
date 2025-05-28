import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'models/app_theme.dart';
import 'models/size_config.dart';
import 'screens/authentication/presentation/view/sign_in_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/onboard/onboarding_screen.dart';
import 'screens/screens.dart';

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({required this.showHome, Key? key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MaterialApp(
      title: 'Pigeon',
      // themeMode: AppTheme.themeMode,
      theme: AppTheme.lightTheme(
        context: context,
      ),
      darkTheme: AppTheme.darkTheme(
        context: context,
      ),

      debugShowCheckedModeBanner: false,
      home:
          // Screens()
          showHome ? const Screens() : const OnBoardingScreen(),
    );
  }
}
