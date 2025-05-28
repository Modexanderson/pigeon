import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/constants.dart';
import '../../models/news_item.dart';
import '../../models/size_config.dart';
import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NewsItem> newsItems = [
    NewsItem(
      time: '10:00',
      category: 'Spor',
      title:
          "Murat Sancak deliye döndü: Mert Hakan'a söyle şoförüne sahip çıksın !",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'John Doe',
      authorIcon: 'assets/icons/iha.svg',
      likes: 15,
    ),
    NewsItem(
      time: '11:30',
      category: 'Siyaset',
      title: 'Joe Biden 6 aylık hedeflerini açıkladı. Senato buz gibi…',
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'Doğan Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      likes: 20,
    ),
    NewsItem(
      time: 'Bu Hafta',
      category: 'Gündem',
      title:
          "Van'da mazbata krizinin aşılmasından sonra protestolar, sevinç gösterilerine dönüştü.",
      message:
          'Lorem ipsum dolor sit amet consectetur. Laoreet id enim tellus in integer ut nulla in. Pellentesque adipiscing nibh consequat aliquam laoreet. Odio pulvinar orci vel turpis. Malesuada cursus blandit ultricies urna sed elementum vestibulum.',
      author: 'Doğan Haber Ajansı',
      authorIcon: 'assets/icons/iha.svg',
      image: 'assets/images/new_image.png',
      likes: 600,
    ),
    // Add more news items as needed
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            // Static content at the top
            _buildStaticContent(context),
            // Dynamic content - list of news items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    _buildNewsItem(
                      newsItems[index],
                      context,
                    ),
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

  Widget _buildStaticContent(context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
              child: VerticalDivider(
                width: 25.w,
                thickness: 2,
                color: kSecondaryColor,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w),
              child: SvgPicture.asset(
                'assets/icons/public address.svg',
                color: kSecondaryColor,
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              height: 30.h,
              child: VerticalDivider(
                width: 25.w,
                thickness: 2,
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
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

  bool _isNotified = false;
  Widget _buildNewsItem(NewsItem newsItem, context) {
    IconButton likeButton = IconButton(
      onPressed: () {
        setState(() {
          newsItem.liked = !newsItem.liked;
          if (newsItem.liked) {
            newsItem.likes++;
          } else {
            newsItem.likes--;
          }
        });
      },
      icon: Icon(
        newsItem.liked ? Icons.favorite : Icons.favorite_border,
        size: 30,
        color: newsItem.liked ? Colors.red : kSecondaryColor,
      ),
    );

    IconButton bookmarkButton = IconButton(
      onPressed: () {
        setState(() {
          newsItem.bookmarked = !newsItem.bookmarked;
        });
      },
      icon: Icon(
        newsItem.bookmarked ? Icons.bookmark : Icons.bookmark_border,
        size: 30,
        color: kSecondaryColor,
      ),
    );
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
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 5.0.w),
                  child: SvgPicture.asset(
                    _isNotified
                        ? 'assets/icons/notification.svg'
                        : 'assets/icons/notification_off.svg',
                  ),
                ),
                SizedBox(width: 5.w),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: newsItem.image == null
                      ? 138.h
                      : 301.h, // Specify the height of the vertical divider
                  child: VerticalDivider(
                    width: 25.w,
                    thickness: 2,
                    color: kSecondaryColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsItem.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            overflow: TextOverflow.clip),
                      ),
                      if (newsItem.image != null) ...[
                        Image.asset(newsItem.image!),
                      ],
                      Row(
                        children: [
                          SvgPicture.asset(
                            newsItem.authorIcon,
                            fit: BoxFit.contain,
                            width: 22.w,
                            height: 20.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(newsItem.author, style: authorTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              likeButton,
                              Text(
                                newsItem.likes.toString(),
                                style: const TextStyle(color: kSecondaryColor),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          bookmarkButton,
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
