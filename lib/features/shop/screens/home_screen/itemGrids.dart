import 'package:application/features/shop/screens/home_screen/product_detail.dart';
import 'package:application/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller/basket_controller.dart';
import '../../controllers/home_controller/product_controller.dart';

class popular extends StatelessWidget {
  popular({
    super.key,
    required this.productController,
  });

  final ProductController productController;
  final BasketController basketController = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    final dark = MHelper.isDarkMode(context);
    return Obx(() {
      if (productController.productList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productController.productList.length,
        itemBuilder: (context, index) {
          final product = productController.productList[index];
          return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailPage(product: product));
              },
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Add to Favorite Button
                                IconButton(
                                  icon: Icon(
                                    product.isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: product.isFavourite
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    productController.toggleFavourite(product);
                                    showModalBottomSheet(
                                      context: context,
                                      isDismissible: false,
                                      enableDrag: false,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(
                                            product.isFavourite
                                                ? "Item added to favorites"
                                                : "Item removed from favorites",
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        );
                                      },
                                    );
                                    Future.delayed(const Duration(seconds: 2),(){
                                      if(Navigator.canPop(context)){
                                        Navigator.pop(context);
                                      }
                                    }
                                    );
                                  }
                                )
                              ],
                            ),
                            // Product Image
                            Image.network(
                              product.image,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Column(
                              children: [
                                // Product Name
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Action Buttons
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Product Price
                                    Text(
                                      "\$${product.price.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:
                                            dark ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    Obx(() {
                                      final isInBasket = basketController.basketItems.contains(product);
                                      return IconButton(
                                          icon: Icon(
                                            isInBasket
                                                ? Icons.done
                                                : Icons.add_box_sharp,
                                            color: dark
                                                ? Colors.white
                                                : Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            basketController
                                                .toggleItemInBasket(product);
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  padding: const EdgeInsets.all(16),
                                                  child: Text(
                                                    isInBasket
                                                        ? "Item removed from basket"
                                                        : "Item added to basket",
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                );
                                              },
                                            );
                                            Future.delayed(const Duration(seconds: 1),(){
                                              if(Navigator.canPop(context)){
                                                Navigator.pop(context);
                                              }
                                            }
                                            );
                                          }
                                      );
                                    }
                                    )
                                  ]
                                    ),
                            )
                          ]))));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
      );
    });
  }
}
