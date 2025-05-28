import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/constants.dart';
import '../../models/size_config.dart';
import '../../widgets/custom_button.dart';

class AdditionalInformationScreen extends StatefulWidget {
  const AdditionalInformationScreen({super.key});

  @override
  State<AdditionalInformationScreen> createState() =>
      _AdditionalInformationScreenState();
}

class _AdditionalInformationScreenState
    extends State<AdditionalInformationScreen> {
  final TextEditingController dobController = TextEditingController();
  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  List<String> selectedInterests = [];

  final List<Map<String, dynamic>> interests = [
    {'name': 'Gündem', 'image': 'assets/images/ramazan.png'},
    {'name': 'Ekonomi', 'image': 'assets/images/futbol.png'},
    {'name': 'Bilim', 'image': 'assets/images/maas.png'},
    {'name': 'Spor', 'image': 'assets/images/bayram.png'},
  ];

  DateTime? selectedDate;
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/icons/Logo.svg')
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //   ),
        //   onPressed: Navigator.of(context).pop,
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildGenderWidget(
                        'Erkek',
                        selectedGender,
                        () {
                          setState(() {
                            if (selectedGender != 'Erkek') {
                              selectedGender = 'Erkek';
                            } else {
                              selectedGender = '';
                            }
                          });
                        },
                      ),
                      buildGenderWidget(
                        'Kadın',
                        selectedGender,
                        () {
                          setState(() {
                            if (selectedGender != 'Kadın') {
                              selectedGender = 'Kadın';
                            } else {
                              selectedGender = '';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  buildDateOfBirthField(context),
                  SizedBox(height: 80.h),
                  buildInterestsScrollView(),
                  SizedBox(height: 20.h),
                  CustomButton(
                    text: 'Üyeliği Tamamla',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGenderWidget(
    final String text,
    final String selectedGender,
    final VoidCallback onTap,
  ) {
    Color? selectedColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;

    Color? selectedTextColor =
        selectedGender == text ? kPrimaryDarkColor : kPrimaryLightColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 160.w,
        decoration: BoxDecoration(
          color: selectedGender == text ? selectedColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(10.0.sp),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selectedTextColor,
            fontSize: 18.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildDateOfBirthField(BuildContext context) {
    Color? fillColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor; // Adjust the color for dark theme if needed
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0.sp),
        height: 70.h,
        decoration: BoxDecoration(
          border: Border.all(width: 2.0.w),
          color: fillColor,
          borderRadius: BorderRadius.circular(10.0.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? formatDate(selectedDate!)
                  : 'Doğrum Tarihi',
              style: const TextStyle(color: kPrimaryDarkAccentColor),
            ),
            const Icon(
              Icons.calendar_today,
              color: kPrimaryDarkAccentColor,
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget buildInterestsScrollView() {
    Color? selectedColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor; // Adjust the color for dark theme if needed
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'ilgi Alanlarin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 16.0.w,
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: interests
                .map(
                  (interest) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedInterests.contains(interest['name'])) {
                          selectedInterests.remove(interest['name']);
                        } else {
                          selectedInterests.add(interest['name']);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  height: 160.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 2,
                                          sigmaY:
                                              2), // Adjust the sigma values as needed
                                      child: Image.asset(
                                        interest['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 8,
                                  child: Center(
                                    child: Text(
                                      interest['name'],
                                      style: TextStyle(
                                        color: selectedInterests
                                                .contains(interest['name'])
                                            ? kPrimaryLightColor
                                            : kPrimaryDarkColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 20.h), // Adjust the spacing as needed
                          Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color:
                                  selectedInterests.contains(interest['name'])
                                      ? selectedColor
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(
                                color: selectedColor,
                                width: 2
                                    .w, // Adjust the width of the outline as needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
