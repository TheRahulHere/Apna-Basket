import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import '../utils/device/device_utility.dart';

class MTabBar extends StatelessWidget implements PreferredSizeWidget{
  const MTabBar({
    super.key, required this.tabs,
  });
final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark=MHelper.isDarkMode(context);
     return Material(
       color: dark?  Colors.black:Colors.white ,
       child: TabBar(
         tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorColor: Colors.red,
          unselectedLabelColor: MColors.darkGrey,
          labelColor: MHelper.isDarkMode(context)?Colors.white:Colors.black,
          tabs: tabs,
           ),
     );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight());
}