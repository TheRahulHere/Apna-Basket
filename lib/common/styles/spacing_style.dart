import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class MSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
      top: MSizes.appBarHeight,
      left: MSizes.defaultSpace,
      bottom: MSizes.defaultSpace,
      right: MSizes.defaultSpace
  );
}