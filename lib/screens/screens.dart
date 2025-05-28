import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/constants.dart';
import '../widgets/delete_account_dialog.dart';
import '../widgets/title_text.dart';
import 'about_us/about_us_screen.dart';
import 'contact_us/contact_us_screen.dart';
import 'exchange/exchange_screen.dart';
import 'home/home_screen.dart';
import 'offline/offline_downloading_screen.dart';
import 'offline/offline_screen.dart';
import 'pigeon/pigeon_screen.dart';
import 'privacy_policy/privacy_policy_screen.dart';
import 'profile/profile_screen.dart';
import 'search/search_screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  int _selectedIndex = 0;
  final List<String> _titles = ['Home', 'Pigeon', 'Search', 'Profile'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleText(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangeScreen(),
                        ),
                      );
            },
            icon: SvgPicture.asset(
              'assets/icons/currency exchange.svg',
              color: color,
              width: 20.w,
            ),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: SvgPicture.asset(
              'assets/icons/bookmark.svg',
              color: color,
              width: 20.w,
            ),
          ),
        ],
      ),
      body: 
      // const PrivacyPolicyScreen(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(),
            PigeonScreen(),
            SearchScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: kBottomNavigationBarHeight,
              color: color, // Set background color of the BottomNavigationBar
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg', // Icon for Home
                    color: color, // Set icon color based on selected index
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10.sp), // Set border radius for the selected item
                  ),
                  child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      'assets/icons/pigeon.svg', // Icon for Test

                      color: color, // Set icon color based on selected index
                    ),
                  ),
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg', // Icon for Resources
                    color: color, // Set icon color based on selected index
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 3
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg', // Icon for Resources
                    color: color, // Set icon color based on selected index
                  ),
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors
                .transparent, // Set transparent to hide default selection color
            currentIndex: _selectedIndex, // Set the current selected index
            onTap: _onItemTapped, // Handle tap events
            showSelectedLabels: false, // Hide default selected label
            showUnselectedLabels: false, // Hide default unselected label
            type: BottomNavigationBarType
                .fixed, // Ensure all icons are displayed with fixed width
          ),
        ],
      ),
      floatingActionButton: _selectedIndex ==
              0 // Check if the selected index is for the TestScreen
          ? FloatingActionButton(
              backgroundColor: kSecondaryColor,
              onPressed: () {},
              child: SvgPicture.asset('assets/icons/phone.svg',
                  color: color.withAlpha(255)),
            )
          : null,
    );
  }

  
}
