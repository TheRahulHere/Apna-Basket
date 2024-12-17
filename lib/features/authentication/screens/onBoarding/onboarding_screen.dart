import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/onBoarding/onboarding_controller.dart';
import 'Widgets/boarding_navigation.dart';
import 'Widgets/boarding_pages.dart';
import 'Widgets/next_button.dart';

class OnboardingScreen extends StatelessWidget {
  final controller=Get.put(OnboardingController());
  OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image:'assets/images/onBoarding/app-online-store.gif',
                  title: MTexts.onBoardingTitle1,
                  subTitle: MTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image:'assets/images/onBoarding/onboard1.jpeg',
                  title: MTexts.onBoardingTitle2,
                  subTitle: MTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image:'assets/images/onBoarding/sho.jpg',
                  title: MTexts.onBoardingTitle3,
                  subTitle: MTexts.onBoardingSubTitle3),
            ],
          ),

          // skip button
          const onBoardingNavigation(),
          const boarding_next_button()
        ],
      ),
    );
  }
}




