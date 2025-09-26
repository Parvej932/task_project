import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../constants/colors.dart';
import '../../helpers/onboard_model.dart';
import '../controller/video.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardModel> onboardData = [
    OnboardModel(
        video: VideoContainer(videoPath: 'assets/videos/1.mp4'),
        title: "Discover the world, one journey at a time.",
        description:"From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today."
    ),
    OnboardModel(
        video: VideoContainer(videoPath: 'assets/videos/2.mp4'),
        title: "Explore new horizons, one step at a time.",
        description:"Every trip holds a story waiting to be lived. Let us guide you to experiences that inspire, connect, and last a lifetime."
    ),
    OnboardModel(
        video: VideoContainer(videoPath: 'assets/videos/3.mp4'),
        title: "See the beauty, one journey at a time.",
        description:"Travel made simple and exciting—discover places you’ll love and moments you’ll never forget."
    ),
  ];
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index){
                    setState(() {
                      _currentIndex = index ;
                    });
                  },
                  itemCount: onboardData.length,
                  itemBuilder: (_, index){
                    return Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              onboardData[index].video  ,
                              Positioned(
                                  top: 26,
                                  right: 20,
                                  child:
                                  InkWell(
                                      onTap: (){
                                        _controller.nextPage(duration: Duration(milliseconds: 500),
                                            curve: Curves.ease);
                                      },
                                      child: CustomText(text: "Skip")))
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                          child: Column(
                            children: [
                              PrimaryText(text: onboardData[index].title),
                              SizedBox(height: 15,),
                              SecondaryText(text: onboardData[index].description)
                            ],
                          ),
                        ),

                      ],
                    );
                  }),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardData.length, (index){
                    return Container(
                      height: 15,
                      width: _currentIndex == index ? 10:8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index ? MyColors.buttonColor : MyColors.buttonColor.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      margin: EdgeInsets.only(right: 5),
                    );
                  }),
                ),
                SizedBox(height: 20,),
                CustomButton(label: 'Next', onPressed: (){
                  _controller.nextPage(duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
