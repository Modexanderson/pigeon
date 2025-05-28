import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/constants.dart';
import '../../models/currency_item.dart';
import '../../widgets/title_text.dart';

class ExchangeScreen extends StatelessWidget {
  ExchangeScreen({super.key});

  final List<CurrencyItem> currencyItem = [
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: false),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: false),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: false),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
    CurrencyItem(
        title: 'Dolar',
        subTitle: 'Dolar',
        icon: 'assets/icons/dolar.svg',
        trailingSubTitle: 'TL',
        buyingRate: 323506,
        sellingRate: 323506,
        sellPercentage: 1.3,
        buyPercentage: 1.3,
        isCurrencyRised: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleText(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currencyItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          SvgPicture.asset(
                          currencyItem[index].icon,
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currencyItem[index].title, style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,),),),
                            Row(
                              children: [
                                Text(currencyItem[index].subTitle, style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400,),),),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: kTextColor,
                                  size: 7.w,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(currencyItem[index].trailingSubTitle, style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400,),),),
                              ],
                            ),
                          ],
                        ),
            
                        ],),
                        
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                 Text('Alış', style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600,),),),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  '${currencyItem[index].buyingRate} ₺', overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,),),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      currencyItem[index].isCurrencyRised
                                          ? CupertinoIcons.arrowtriangle_up_fill
                                          : CupertinoIcons
                                              .arrowtriangle_down_fill,
                                      size: 8.w,
                                      color: currencyItem[index].isCurrencyRised
                                          ? kCurrnecyRiseColor
                                          : kCurrnecyFallColor,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      '${currencyItem[index].buyPercentage}%', style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400,),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 54.h,
                                child: const VerticalDivider(
                                  thickness: 3,
                                  width: 20,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                 Text('Satış', style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600,),),),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  '${currencyItem[index].buyingRate} ₺', overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,),),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      currencyItem[index].isCurrencyRised
                                          ? CupertinoIcons.arrowtriangle_up_fill
                                          : CupertinoIcons
                                              .arrowtriangle_down_fill,
                                      size: 8.w,
                                      color: currencyItem[index].isCurrencyRised
                                          ? kCurrnecyRiseColor
                                          : kCurrnecyFallColor,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      '${currencyItem[index].sellPercentage}%', style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400,),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
