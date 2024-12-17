import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/onBoarding/onboarding_controller.dart';

class boarding_next_button extends StatelessWidget {
  const boarding_next_button({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark=MHelper.isDarkMode(context);
    return Positioned(
        right:MSizes.defaultSpace,
        bottom: MDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: ()=>OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape:const CircleBorder(),backgroundColor: dark? MColors.primary:Colors.black),
          child: const Icon(Icons.arrow_forward_ios_outlined),
        ));
  }
}