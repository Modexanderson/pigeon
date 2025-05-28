import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    Color? color = Theme.of(context).brightness == Brightness.dark
        ? kPrimaryLightColor
        : kPrimaryDarkColor;
    return SvgPicture.asset(
      'assets/icons/pigeon with sub white.svg',
      color: color,
    );
  }
}
