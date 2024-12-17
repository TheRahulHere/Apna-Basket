import 'package:get/get.dart';

import '../utils/validators/network_manager.dart';
class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}