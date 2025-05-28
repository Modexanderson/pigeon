// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      this.text,
      this.fontWeight,
      this.max,
      this.size,
      this.minSize,
      this.color,
      this.style,
      this.textAlign,
      this.letterSpacing});
  final String? text;
  final FontWeight? fontWeight;
  final int? max;
  final double? size;
  final double? minSize;
  final Color? color;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    int textLength = text?.length ?? 0;

    return AutoSizeText(
      textLength >= 8 ? text! : ' ${text}  ',
      style: style ??
          GoogleFonts.balooBhaijaan2(
              color: color ?? Colors.black87,
              fontSize: size ?? 16,
              letterSpacing: letterSpacing ?? 1,
              fontWeight: fontWeight ?? FontWeight.normal),
      minFontSize: minSize ?? 12,
      overflow: TextOverflow.ellipsis,
      maxLines: max ?? 1,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
