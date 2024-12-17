import 'package:get/get.dart';

class HomeController1 extends GetxController{
  static HomeController1 get  instance => Get.find();
  final carousalCurrentIndex=0.obs;
  void updatePageIndicator(index){
    carousalCurrentIndex.value=index;
  }
}