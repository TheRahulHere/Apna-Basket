import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller/basket_controller.dart';
import 'Address/new_address.dart';

class BasketPage extends StatelessWidget {
  final BasketController basketController = Get.find<BasketController>();

   BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Basket"),
      ),
      body: Column(
        children: [
          // Display the basket items
          Expanded(
            child: Obx(() {
              if (basketController.basketItems.isEmpty) {
                return const Center(
                  child: Text(
                    "Your basket is empty!",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              return ListView.builder(
                itemCount: basketController.basketItems.length,
                itemBuilder: (context, index) {
                  final product = basketController.basketItems[index];
                  return ListTile(
                    leading: Image.network(product.image, width: 50),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        basketController.toggleItemInBasket(product);
                      },
                    ),
                  );
                },
              );
            }),
          ),

          // Display subtotal and order button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              final isBasketEmpty = basketController.basketItems.isEmpty;

              return Column(
                children: [
                  // Subtotal Text
                  Text(
                    "Subtotal: \$${basketController.subtotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Order Now Button
                  ElevatedButton(
                    onPressed: isBasketEmpty
                        ? null
                        : () {
                      // Navigate to the AddressFormPage
                      Get.to(() => AddressFormPage(onAddressSubmitted: (address) {
                        basketController.placeOrder(address);
                      })); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
