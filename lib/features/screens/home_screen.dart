import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskproject/common_widgets/custom_text.dart';
import 'package:taskproject/common_widgets/custom_textfield.dart';

import '../../common_widgets/custom_switch.dart';
import '../../constants/colors.dart';
import '../controller/switch_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchController controller = Get.put(SwitchController());
    final RxBool switch1 = false.obs;
    final RxBool switch2 = false.obs;
    final RxBool switch3 = false.obs;
    return Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.backgroundColor2,
              MyColors.backgroundColor1,
            ],
          ),
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: "Selected Location"),
                  SizedBox(height: 10,),
                  CustomTextField(hintText: "Add your location",
                    prefixIcon: Icon(Icons.location_on_outlined, color: MyColors.textColor.withOpacity(0.8),),
                  ),
                ],
              ),

              SizedBox(height: 25,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: "Alarms"),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 56,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                      color: MyColors.darkColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "7:10 pm"),
                        Row(
                          children: [
                            CustomText(text: "Fri 21 Mar 2025",fontSize: 14,),
                            SizedBox(width: 8,),
                            CustomSwitch(state: switch1,

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 56,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        color: MyColors.darkColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "7:10 pm"),
                        Row(
                          children: [
                            CustomText(text: "Fri 21 Mar 2025",fontSize: 14,),
                            SizedBox(width: 8,),
                            CustomSwitch(state: switch2),

                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 56,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        color: MyColors.darkColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "7:10 pm"),
                        Row(
                          children: [
                            CustomText(text: "Fri 21 Mar 2025",fontSize: 14,),
                            SizedBox(width: 8,),
                            CustomSwitch(state: switch3),



                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: MyColors.buttonColor,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: MyColors.textColor,),
      ),
    );
  }
}
