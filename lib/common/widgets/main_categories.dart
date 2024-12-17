import 'package:application/features/shop/screens/store_screen/Store_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class main_categories extends StatelessWidget {
  const main_categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 8,bottom: 5,right: 8),
              child: GestureDetector(
                onTap: (){
                  Get.to(const MStoreScreen(initialTabIndex:0,));
                },
                child: Container(
                  height: 300,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/categories/dry.png"),

                      )
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(const MStoreScreen(initialTabIndex:3,));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5,top: 8,bottom: 5,right: 8),
                child: Container(
                  height: 300,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/categories/kitchen1.png"),

                      )
                  ),
                ),
              ),
            ),
           GestureDetector(
                onTap: (){
                  Get.to(const MStoreScreen(initialTabIndex:4));
                },
              child: Padding(
                padding: const EdgeInsets.only(left: 5,top: 8,bottom: 5,right: 10),
                child: Container(
                  height: 300,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/categories/mack.png"),

                      )
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}