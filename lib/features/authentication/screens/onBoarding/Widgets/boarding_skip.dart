import 'package:flutter/material.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controller/onBoarding/onboarding_controller.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left:MDeviceUtils.getAppBarHeight(),right: -250,
        top: 10,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('Skip',style: TextStyle(fontWeight: FontWeight.bold),),));
  }
}