import 'package:application/features/shop/controllers/home_controller/basket_controller.dart';
import 'package:application/features/shop/screens/home_screen/itemGrids.dart';
import 'package:application/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/AppBar/my_app_bar.dart';
import '../../../../common/MyText.dart';
import '../../../../common/widgets/main_categories.dart';
import '../../controllers/home_controller/product_controller.dart';
import 'Discount_banner/slider.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ProductController productController = Get.put(ProductController());
  final BasketController basketController = Get.put(BasketController());
  @override
  Widget build(BuildContext context) {
    final dark=MHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const MyRichText(mText: "Apna", mText1: "Basket"),
        actions: const [MAppBar()],
      ),
      body:  SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  search container
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                           decoration: InputDecoration(
                             prefixIcon: const Icon(Icons.search),
                hintText: "Search you're Looking for",
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                 color: dark?Colors.white:Colors.black
                               )
                             )
                           ),
                       ),
             ),
            // text= get ready to buy exciting items
          const MyRichText(
              mText1: 'Get Ready To Buy',
              mText2: ' Exciting',
              mText3: ' Items',
            ),
            const main_categories(),
            // discount posters..
            const DiscountSlider(),
            const MyRichText(
              mText1: 'Popular',
              mText2: ' Items',
            ),
            popular(productController: productController),
          ],
        ),
      ),
    );
  }
}






