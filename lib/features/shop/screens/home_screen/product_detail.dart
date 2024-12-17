import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller/basket_controller.dart';
import '../../screens/home_screen/product.dart';
import '../../../../common/MyText.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Get instance of BasketController
    final basketController = Get.find<BasketController>();

    return Scaffold(
      appBar: AppBar(
        title: const MyRichText(mText: "Apna", mText1: "Basket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Product Image
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white.withOpacity(0.1),
              child: Image.network(
                product.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 18),
            // Product Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const Spacer(),
            // Add to Basket Button
            Obx(() {
              // Check if the product is in the basket
              final isInBasket = basketController.basketItems.contains(product);
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    basketController.toggleItemInBasket(product);
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInBasket ? Colors.red : Colors.red,
                  ),
                  child: Text(
                    isInBasket ? "Added" : "Add to Basket",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
