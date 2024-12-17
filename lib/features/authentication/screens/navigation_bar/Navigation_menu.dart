import 'package:application/features/authentication/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shop/screens/WishList/favouriteItems.dart';
import '../../../shop/screens/home_screen/home.dart';
import '../../../shop/screens/profile_screen/profile.dart';
import '../../../shop/screens/store_screen/Store_Screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final controller1= UserController.instance;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.storefront_sharp), label: "Store"),
            NavigationDestination(
                icon: Icon(Icons.live_tv_rounded), label: "Wishlist"),
            NavigationDestination(
                icon: Icon(Icons.perm_identity), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
     HomeScreen(),const MStoreScreen(), FavouritePage() ,const MyProfile(),
  ];
}
