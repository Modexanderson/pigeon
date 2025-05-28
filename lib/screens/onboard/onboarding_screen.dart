import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigeon/models/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/onboard.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: ((value) {
              setState(() {
                isLastPage = value == 2;
              });
            }),
            children: [
              OnBoard(
                urlImage: 'assets/images/onboarding1.png',
                title: 'Hızlı Haber',
                subtitle:
                    'Günümüzde her an bağlantıda kalmak önemli olsa da, internetin her zaman el altında olmadığı durumlar da vardır',
                footText: 'Atla',
                isLastPage: isLastPage,
              ),
              OnBoard(
                urlImage: 'assets/images/onboarding2.png',
                title: 'Nerde Olursan Ol!',
                subtitle:
                    'Günümüzde her an bağlantıda kalmak önemli olsa da, internetin her zaman el altında olmadığı durumlar da vardır',
                footText: 'Atla',
                isLastPage: isLastPage,
              ),
              OnBoard(
                urlImage: 'assets/images/onboarding3.png',
                title: 'Çevrimdışı Kullanım',
                subtitle:
                    'Günümüzde her an bağlantıda kalmak önemli olsa da, internetin her zaman el altında olmadığı durumlar da vardır',
                footText: 'Misafir Olarak Devam Et',
                isLastPage: isLastPage,
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              centerTitle: true,
              title: SvgPicture.asset('assets/icons/Logo.svg')
            ),
          ),
          Positioned(
            top: isLastPage ? 490.h : 535.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 10,
                  dotColor: kSecondaryColor,
                  activeDotColor: kPrimaryLightColor,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
