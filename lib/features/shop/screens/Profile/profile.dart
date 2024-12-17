import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_function.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MHelper.isDarkMode(context);
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: dark? Colors.white:Colors.black,
      ),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
