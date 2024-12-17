import 'package:application/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';
import '../../../../features/shop/models/category_model.dart';
import 'catagory_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
//Show Loader shale Loading categories
      isLoading.value = true;
// Fetch categories from data source (FireStore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();
//Update the categories List
      allCategories.assignAll(categories);
// filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(3)
          .toList());
    } catch (e) {
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value=false;
    }
  }
}
