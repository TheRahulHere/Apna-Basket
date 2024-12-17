import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/home_screen/product.dart';
 // Replace with your actual product model

class BasketController extends GetxController {
  var basketItems = <Product>[].obs;

  void toggleItemInBasket(Product product) {
    if (basketItems.contains(product)) {
      basketItems.remove(product);
    } else {
      basketItems.add(product);

    }
  }

  double get subtotal {
    return basketItems.fold(0.0, (sum, item) => sum + item.price);
  }

  Future<void> placeOrder(Map<String, dynamic> address) async {
    if (basketItems.isEmpty) return;

    // Prepare order data
    final orderData = {
      "address": address,
      "timestamp": Timestamp.now(),
      "items": basketItems.map((product) => {
        "id": product.id,
        "name": product.name,
        "price": product.price,
        "quantity": 1, // Assuming 1 quantity per item
      }).toList(),
    };

    // Save order to Firestore
    try {
      await FirebaseFirestore.instance.collection("orders").add(orderData);
      Get.snackbar("Order Successful", "Your order has been placed!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);

      // Clear the basket after placing the order
      basketItems.clear();
    } catch (e) {
      Get.snackbar("Order Failed", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
