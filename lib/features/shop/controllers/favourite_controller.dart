import 'dart:convert';

import 'package:application/common/widgets/loaders/loaders.dart';
import 'package:application/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = MLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      MLoaders.customToast(message: 'Product has been added to the WishList');
    } else {
      MLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      MLoaders.customToast(
          message: 'Product has been removed from the wishlist');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    MLocalStorage.instance().saveData('favorites', encodedFavorites);
  }
}
//
//   Future<List<ProductModel>> favoriteProducts()async{
//     return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
//   }
// }