import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskproject/features/screens/home_screen.dart';
import 'package:taskproject/features/screens/location.dart';

import 'features/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parvej Task',
        home:
         Onboarding(),
     // Location()
     // HomeScreen(),
        getPages: [
          GetPage(name: '/', page: () => Onboarding()),
          GetPage(name: '/location', page: () => Location()),
        GetPage(name: '/home', page: () => HomeScreen()),
    ],

    );
  }
}



