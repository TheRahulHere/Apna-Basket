import 'package:application/features/authentication/controller/user_controller.dart';
import 'package:application/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class MUserProfile extends StatelessWidget {
  const MUserProfile({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = MHelper.isDarkMode(context);
    final controller = UserController.instance;
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: const Icon(
          Icons.manage_accounts,
          color: Colors.red,
          size: 40,
        ),
      ),
      title: Text(
        controller.user.value.fullName,
        style: TextStyle(
          color: dark ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: TextStyle(
          color: dark ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
      //   trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.edit_calendar_outlined,)),
    );
  }
}
