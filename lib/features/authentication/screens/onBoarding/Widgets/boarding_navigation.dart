import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/onBoarding/onboarding_controller.dart';

class onBoardingNavigation extends StatelessWidget {
  const onBoardingNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller=OnboardingController.instance;
    final dark=MHelper.isDarkMode(context);
    return Positioned(
        bottom: MDeviceUtils.getBottomNavigationBarHeight()+25,
        left: MSizes.defaultSpace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect: ExpandingDotsEffect(activeDotColor: dark ? MColors.light : MColors.dark,dotHeight:6 )));
  }
}