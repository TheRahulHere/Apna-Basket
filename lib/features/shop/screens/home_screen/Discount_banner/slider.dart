
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controllers/home_controller/homeController.dart';
import 'banners.dart';

class DiscountSlider extends StatelessWidget {
  const DiscountSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=MHelper.isDarkMode(context);
    final controller = Get.put(HomeController1());
    return Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8,bottom: 4),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index,_)=>controller.updatePageIndicator(index)
              ),
              items: const [
                banners(imageUrl: 'assets/images/onBoarding/ba.jpg', isNetworkImage: false),
                banners(imageUrl: 'assets/images/onBoarding/ban.jpg', isNetworkImage: false),
                banners(imageUrl: 'assets/images/onBoarding/banner.jpg', isNetworkImage: false)
              ],
            ),
            Obx(
            ()=> Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<3;i++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 4,
                        width: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          color: controller.carousalCurrentIndex.value==i?dark?Colors.white:Colors.black:Colors.red,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        )
    );
  }
}