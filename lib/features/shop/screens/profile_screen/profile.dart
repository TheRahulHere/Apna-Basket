import 'package:application/features/authentication/controller/user_controller.dart';
import 'package:application/features/shop/screens/profile_screen/order_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Profile/profile.dart';
import 'Mycart.dart';
import 'myListTile.dart';



class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= UserController.instance;
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: const Text("   Account",style: TextStyle(fontSize: 25),),
     ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MUserProfile(onPressed: (){}),
          MyMenu(icon: Icons.manage_history_sharp, title: 'Order History',subTitle: 'Look on your old orders',onTap: ()=> Get.to(()=> const OrderHistoryPage())),
          MyMenu(icon: Icons.shopping_cart, title: 'My Basket',subTitle: 'Add,remove your items',onTap: ()=>Get.to(()=> BasketPage()),),
          const MyMenu(icon: Icons.notifications, title: 'Notifications',subTitle: 'Set Messages'),
          const MyMenu(icon: Icons.support_agent, title: 'Customer Support',subTitle: 'You can register your issues'),
          const MyMenu(icon: Icons.star, title: 'Review & Ratings',subTitle: 'Give your precious ratings',),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}
