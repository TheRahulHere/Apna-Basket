import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/AppBar/my_app_bar.dart';
import '../../../../common/MyText.dart';
import '../../../../common/my_tab_bar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controllers/home_controller/basket_controller.dart';
import '../../controllers/home_controller/product_controller.dart';
import '../home_screen/product_detail.dart';

class MStoreScreen extends StatelessWidget {
  final int initialTabIndex;
  const MStoreScreen({super.key,  this.initialTabIndex=0});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final BasketController basketController = Get.find<BasketController>();


    return DefaultTabController(
      length: 5,
      initialIndex: initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const MyRichText(mText: "Apna", mText1: "Basket"),
          actions: const [MAppBar()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 200,
                automaticallyImplyLeading: false,
                backgroundColor:
                    MHelper.isDarkMode(context) ? Colors.black : Colors.white,
                flexibleSpace: const Padding(
                  padding: EdgeInsets.all(MSizes.defaultSpace),
                ),
                bottom: const MTabBar(tabs: [
                  Tab(child: Text("DryFruits")),
                  Tab(child: Text("Vegetables")),
                  Tab(child: Text("Health")),
                  Tab(child: Text("Masalas")),
                  Tab(child: Text("Bakery")),
                ]),
              )
            ];
          },
          body: const TabBarView(
            children: [
              ProductListView(category: 'DryFruits'),
              ProductListView(category: 'Vegetables'),
              ProductListView(category: 'Health'),
              ProductListView(category: 'Masalas'),
              ProductListView(category: 'Bakery'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  final String category;

  const ProductListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final BasketController basketController = Get.find<BasketController>();
    final dark = MHelper.isDarkMode(context);

    return Obx(() {
      final categoryProducts = productController.productList
          .where((product) => product.category == category)
          .toList();

      if (categoryProducts.isEmpty) {
        return const Center(
          child: Text("No Products Available in this Category."),
        );
      }

      return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final product = categoryProducts[index];
          return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailPage(product: product));
              },
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Product Image
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
                                      productController
                                          .toggleFavourite(product);
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              product.isFavourite
                                                  ? "Item added to favorites"
                                                  : "Item removed from favorites",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          );
                                        },
                                      );
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        if (Navigator.canPop(context)) {
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                  ),
                                ]),
                            Image.network(
                              product.image,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Column(children: [
                              // Product Name
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Product Price
                                  Text(
                                    "\$${product.price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: dark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  // Add to Basket Button
                                  Obx(() {
                                    final isInBasket = basketController
                                        .basketItems
                                        .contains(product);
                                    return IconButton(
                                      icon: Icon(
                                        isInBasket
                                            ? Icons.done
                                            : Icons.add_box_sharp,
                                        color:
                                            dark ? Colors.white : Colors.black,
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
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            );
                                          },
                                        );
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          if (Navigator.canPop(context)) {
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ]))));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8, // Adjusted to fit content better
        ),
      );
    });
  }
}