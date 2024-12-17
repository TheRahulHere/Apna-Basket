import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/shop/screens/profile_screen/Mycart.dart';

class MAppBar extends StatelessWidget {
  const MAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          IconButton(onPressed: ()=>Get.to(()=> BasketPage()), icon: const Icon(Icons.shopping_cart,color: Colors.red,size: 30,),),
        ]
    );
  }
}