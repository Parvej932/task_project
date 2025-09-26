import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  final RxBool state;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;

  const CustomSwitch({
    Key? key,
    this.width = 40,
    this.height = 20,
    this.activeColor = MyColors.buttonColor,
    this.inactiveColor = MyColors.textColor,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () => state.toggle(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        height: height,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: state.value ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: state.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width: height - 8,
            height: height - 8,
            decoration: BoxDecoration(
              color:
              state.value ? MyColors.textColor : MyColors.boxColor2,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    ));
  }
}
