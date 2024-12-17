// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../../utils/exceptions/platform_exceptions.dart';
//
// class ProductRepository extends GetxController {
//   static ProductRepository get instance => Get.find();
//
//   /// FireStore instance for dotabase interaction
//   final _db = FirebaseFirestore.instance;
//
//   /// Get Limited featured products
//   Future<List<ProductModel>> getFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection('Products').where(
//           'IsFeatured', isEqualTo: true).limit(4).get();
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e) {
//       throw MFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw MPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//
//   /// Get Linited featured proovets
//   Future<List<ProductModel>> getAllFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection('Products').where(
//           'IsFeatured', isEqualTo: true).get();
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e) {
//       throw MFirebaseException(e.code).message;
//     }
//     on PlatformException catch (e) {
//       throw MPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//   /// Get Products basen en the Queru
//   Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
//     try {
//       final querySnapshot = await query.get();
//       final List<ProductModel> productList = querySnapshot.docs.map((doc) =>
//           ProductModel.fronQuerySnapshot(doc)).toList();
//       return productList;
//     } on FirebaseException catch (e) {
//       throw MFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw MPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something sent wrong. Please try again';
//     }
//   }
//   Future<List<ProductModel>> getFavouriteProducts(List<String> productsIds) async {
//     try {
//       final snapshot = await _db.collection('Products').where(FieldPath.documentId,whereIn: productsIds).get();
//       final List<ProductModel> productList = querySnapshot.docs.map((doc) =>
//           ProductModel.fronQuerySnapshot(doc)).toList();
//       return productList;
//     } on FirebaseException catch (e) {
//       throw MFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw MPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something sent wrong. Please try again';
//     }
//   }
//   Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit =-1}) async{
//   try {
//     final querySnapshot = limit == -1
//         ? await _db.collection('Products')
//         .where('Brand.Id', isEqualTo: brandId)
//         .get()
//         : await _db.collection('Products')
//         .where('Brand.Id', isEqualTo: brandId)
//         .limit(limit)
//         .get();
//     final products = querySnapshot.docs.map((doc) =>
//         ProductModel.fromSnapshot(doc)).toList();
//     return products;
//   }on FirebaseException catch (e) {
//     throw MFirebaseException(e.code).message;
//   }on PlatformException catch (e) {
//   throw MPlatformException(e.code).message;
//   } catch (e) {
//   throw 'Something sent wrong. Please try again';
//   }
// }
