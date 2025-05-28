// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import '../../models/constants.dart';

class OfflineDownloadingScreen extends StatefulWidget {
  const OfflineDownloadingScreen({super.key});

  @override
  _OfflineDownloadingScreenState createState() =>
      _OfflineDownloadingScreenState();
}

class _OfflineDownloadingScreenState extends State<OfflineDownloadingScreen> {
  double _progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Simulate download progress with a timer
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.01;
        if (_progress >= 1.0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'indiriliyor',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: kSecondaryColor,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${(100 * _progress).toInt()}/100',
                  // '${(100 * _progress).toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
