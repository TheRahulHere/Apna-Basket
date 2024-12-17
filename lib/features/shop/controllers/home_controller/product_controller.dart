import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../screens/home_screen/product.dart';

class ProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var productList = <Product>[].obs;
  var favouritesList = <Product>[].obs;
  var basketList = <Product>[].obs; // List of items in the basket

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts({String? category}) async {
    try {
      Query query = FirebaseFirestore.instance.collection('products');

      if (category != null && category.isNotEmpty) {
        query = query.where('category', isEqualTo: category);
      }

      final snapshot = await query.get();
      productList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; // Explicitly cast
        return Product.fromFirestore(data, doc.id);
      }).toList();
    } catch (e) {
      print("Error fetching products: $e");
    }
  }


  void toggleFavourite(Product product) async {
    product.isFavourite = !product.isFavourite;
    if (product.isFavourite) {
      favouritesList.add(product);
    } else {
      favouritesList.removeWhere((item) => item.id == product.id);
    }
    productList.refresh();

    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .update({'isFavourite': product.isFavourite});
    } catch (e) {
      print("Error updating favourite status: $e");
    }
  }
  void placeOrder(Map<String, dynamic> address, RxList<Product> favouritesList) {
    if (basketList.isEmpty) {
      Get.snackbar("Basket Empty", "Please add items to the basket before ordering.");
      return;
    }

    // Simulate saving order details (Firebase logic should go here)
    for (var product in basketList) {
      product.isAddedToBasket = false; // Reset the basket state
    }
    basketList.clear();
    basketList.refresh();

    Get.snackbar("Order Placed", "Your order has been placed successfully!");
  }


}



