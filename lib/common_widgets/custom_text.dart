import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';


// PrimaryText


class PrimaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const PrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {

    final defaultStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize ?? 28,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? MyColors.textColor,
      ),
    );


    final customStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 28,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? MyColors.textColor,
    );

    return Text(
      text,
      style: fontFamily != null ? customStyle : defaultStyle,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}


//SecondaryText


class SecondaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const SecondaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {

    final defaultStyle = GoogleFonts.oxygen(
      textStyle: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? MyColors.textColor,
      ),
    );


    final customStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? MyColors.textColor,
    );

    return Text(
      text,
      style: fontFamily != null ? customStyle : defaultStyle,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}


//CustomText

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText ({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {

    final defaultStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? MyColors.textColor.withOpacity(0.6),
      ),
    );


    final customStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? MyColors.textColor.withOpacity(0.6),
    );

    return Text(
      text,
      style: fontFamily != null ? customStyle : defaultStyle,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
