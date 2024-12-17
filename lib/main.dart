import 'package:application/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'features/shop/controllers/home_controller/product_controller.dart';

Future<void> main() async {
  // add widget bindings
  final WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  // local storage
  await GetStorage.init();

  // native splash until the other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // initialize firebase and authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value)=>Get.put(AuthenticationRepository()
  )
  );
  Get.put<ProductController>(ProductController());
  runApp(const App());
}