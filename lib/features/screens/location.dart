import 'package:flutter/material.dart';
import 'package:taskproject/common_widgets/custom_button.dart';
import 'package:taskproject/common_widgets/custom_text.dart';

import '../../constants/colors.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.backgroundColor1,
              MyColors.backgroundColor2,
            ],
          ),
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryText(text: "Welcome! Your Smart Travel Alarm"),
              SizedBox(height: 10,),
              SecondaryText(text: "Stay on schedule and enjoy every moment of your journey."),
              SizedBox(height: 25,),
              CircleAvatar(
                radius: 145,
                backgroundImage: AssetImage("assets/images/4.png"),
              ),
              SizedBox(height: 25,),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width *0.9,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: MyColors.textColor.withOpacity(0.5),
                      width: 1),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Use Current Location', style: TextStyle(color: MyColors.textColor)),
                    SizedBox(width: 8),
                    Icon(Icons.location_on_outlined, color: MyColors.textColor),


                  ],
                ),
              ),
            ),

             SizedBox(height: 8,),
              CustomButton(label: "Home", onPressed: (){})

            ],
          ),
        ),
      ),
    );
  }
}
