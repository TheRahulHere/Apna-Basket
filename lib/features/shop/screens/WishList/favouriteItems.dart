import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller/product_controller.dart';

import '../profile_screen/Address/new_address.dart';

class FavouritePage extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourites")),
      body: Column(
        children: [
          // Favourites List
          Expanded(
            child: Obx(() {
              if (productController.favouritesList.isEmpty) {
                return const Center(child: Text("No favourites yet!"));
              }
              return ListView.builder(
                itemCount: productController.favouritesList.length,
                itemBuilder: (context, index) {
                  final product = productController.favouritesList[index];
                  return ListTile(
                    leading: Image.network(product.image, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        productController.toggleFavourite(product);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          // Grand Total and Order Now Button
          Obx(() {
            final grandTotal = productController.favouritesList.fold<double>(
              0.0,
                  (sum, item) => sum + item.price,
            );
            return Column(
              children: [
                // Grand Total
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Grand Total: \$${grandTotal.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                // Order Now Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: productController.favouritesList.isEmpty
                      ? null
                      : () {
                    Get.to(() => AddressFormPage(
                      onAddressSubmitted: (address) {
                        productController.placeOrder(
                            address, productController.favouritesList);
                      },
                    ));
                  },
                  child: const Text("Order Now", style: TextStyle(fontSize: 16)),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
