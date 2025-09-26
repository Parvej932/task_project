import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String hintText;

  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final Color backgroundColor;
  final double? widthFactor; // e.g., 0.9 means 90% width
  final double? height;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixText,
    this.suffixText,
    this.backgroundColor = MyColors.darkColor,
    this.widthFactor = 0.9,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * (widthFactor ?? 0.9),
      height: height,
      padding: const EdgeInsets.fromLTRB(10,5, 5, 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: MyColors.textColor.withOpacity(0.3),
          ),
          hintStyle:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: MyColors.textColor.withOpacity(0.7),
          ),
          prefixIcon: prefixIcon != null ? Padding(
            padding: const EdgeInsets.all(1.0),
            child: prefixIcon,
          )
              : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20,color: MyColors.textColor) : null,
          prefix: prefixText != null
              ? Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              prefixText!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: MyColors.textColor,
              ),
            ),
          )
              : null,

          suffixText: suffixText,
          prefixStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: MyColors.textColor,
          ),
          suffixStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: MyColors.textColor,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: MyColors.textColor,
        ),
      ),
    );
  }
}
