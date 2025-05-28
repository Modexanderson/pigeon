import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/constants.dart';
import '../../models/news_item.dart';

class DetailScreen extends StatelessWidget {
  final String? image;
  final String title;
  final String time;
  final String category;
  final String message;
  DetailScreen(
      {super.key,
      required this.title,
      required this.time,
      required this.category,
      required this.message,
      this.image});

  final List<NewsItem> otherNews = [
    NewsItem(
      time: '10:00',
      category: 'Spor',
      subheader: 'Şimdi',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/family pic.png',
      likes: 15,
      bookmarked: false,
    ),
    NewsItem(
      time: '11:30',
      category: 'Siyaset',
      subheader: 'Bugün',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/news caster.png',
      likes: 20,
      bookmarked: true,
    ),
    NewsItem(
      time: 'Bu Hafta',
      category: 'Gündem',
      subheader: 'Bugün',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'İhlas Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/family pic.png',
      likes: 600,
      bookmarked: true,
    ),
    NewsItem(
      time: 'Bu Hafta',
      category: 'Gündem',
      subheader: 'Dün',
      title:
          "Ünlü isimlerden Ramazan Bayramı paylaşımları! Ailesini kaybeden Zafer Algöz'ün sözleri duygulandırdı",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
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
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image == null)
            SizedBox(height: 10.h),
            image != null
                ? Stack(
                    children: [
                      // This part checks if the image is not null

                      Image.asset(
                        image.toString(),
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),

                      Positioned(
                        top: 5,
                        left: 0,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ],
                  )
                : IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  if (image != null)
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStaticContent(context),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(time, style: smallTextStyle),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.circle, size: 7.w, color: kSecondaryColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(category, style: smallTextStyle),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    message,
                    style: smallTextStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'İlginizi Çekebilir',
                    style: headingStyle,
                  ),
                  const Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: otherNews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildNewsItem(otherNews[index], context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
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
            children: [
              Text(
                newsItem.time,
                style: smallTextStyle,
              ),
              SizedBox(width: 5.w),
              Icon(Icons.circle, size: 7.w, color: kSecondaryColor),
              SizedBox(width: 5.w),
              Text(
                newsItem.category,
                style: smallTextStyle,
              ),
            ],
          ),
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

  Widget _buildStaticContent(context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 37.52.w,
                  child: const Expanded(
                    child: Text(
                      'uyguna \ntatil.com',
                      maxLines: 2,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 10,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w), // Add spacing between texts
                SizedBox(
                  child: Text(
                    'Uygun Tatilin Adresi uygunatatil.com',
                    maxLines: 1,
                    style: TextStyle(
                        color: kPrimaryLightColor,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                        fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
