import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/constants.dart';
import '../../models/news_item.dart';
import '../../models/size_config.dart';
import '../detail/detail_screen.dart';

class PigeonScreen extends StatelessWidget {
  PigeonScreen({super.key});

  final List<NewsItem> newsItems = [
    NewsItem(
      time: '10:00',
      category: 'Spor',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
          message: 'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/family pic.png',
      likes: 15,
      bookmarked: false,
    ),
    NewsItem(
      time: '11:30',
      category: 'Siyaset',
      title:
          'Emekliye neden zam yapılmadı? Bakan Şimşek "İzin veremezdik" diyerek nedenini anlattı',
          message: 'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/news caster.png',
      likes: 20,
      bookmarked: true,
    ),
    NewsItem(
      time: 'Bu Hafta',
      category: 'Gündem',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
          message: 'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/family pic.png',
      likes: 600,
      bookmarked: true,
    ),
    NewsItem(
      time: 'Bu Hafta',
      category: 'Gündem',
      title:
          "Emekliye neden zam yapılmadı? Bakan Şimşek 'İzin veremezdik' diyerek nedenini anlattı",
          message: 'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/news caster.png',
      likes: 600,
      bookmarked: true,
    ),
    // Add more news items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Static content at the top
            buildInterestsScrollView(context),
            SizedBox(height: 20.h),
            // Dynamic content - list of news items
            Text('Neler Oluyor?', style: headingStyle),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 5.h),
                    _buildNewsItem(newsItems[index], context),
                    SizedBox(height: 5.h),
                    const Divider(),
                    SizedBox(height: 5.h),
                  ],
                );
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ));
  }

  Widget _buildNewsItem(NewsItem newsItem, context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return InkWell(
      onTap: () {
        if (newsItem.image != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                category: newsItem.category,
                image: newsItem.image!,
                message: newsItem.message,
                time: newsItem.time,
                title: newsItem.title,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                category: newsItem.category,
                message: newsItem.message,
                time: newsItem.time,
                title: newsItem.title,
              ),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.title,
                      maxLines: 3,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          newsItem.authorIcon,
                          color: kSecondaryColor,
                          fit: BoxFit.contain,
                          width: 22.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(newsItem.author,
                            style: const TextStyle(color: kAuthorTextColor)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              // if (newsItem.image != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.sp),
                child: Expanded(
                  flex: 1,
                  child: Center(
                    child: Image.asset(
                      newsItem.image.toString(),
                      fit: BoxFit.fill,
                      width: 100.w,
                      height: 70.h,
                    ),
                  ),
                ),
              ),
              // ],
            ],
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> interests = [
    {'name': 'Ramazan', 'image': 'assets/images/ramazan.png'},
    {'name': 'Futbol', 'image': 'assets/images/futbol.png'},
    {'name': 'Maaş', 'image': 'assets/images/maas.png'},
    {'name': 'Bayram', 'image': 'assets/images/bayram.png'},
  ];

  Widget buildInterestsScrollView(context) {
    Color? selectedColor = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor; // Adjust the color for dark theme if needed
    return Column(
      children: [
        Row(
          children: [
            // Popüler Konular
            Text(
              'Popüler Konular',
              style: headingStyle,
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20.0.sp,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: interests
                .map(
                  (interest) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 110.w,
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryLightColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Adjust the spacing as needed
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
