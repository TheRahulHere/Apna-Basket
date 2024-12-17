import 'package:application/common/widgets/loaders/full_screen_loader.dart';
import 'package:application/common/widgets/loaders/loaders.dart';
import 'package:application/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:application/utils/validators/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  final hidePassword=true.obs;
  final localStorage=GetStorage();
  final email=TextEditingController();
  final password=TextEditingController();
  GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn()async{
    try{
      MFullScreenLoader.openLoadingDialog('Logging you in.....');

      //check internet  connectivity
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        MFullScreenLoader.stopLoading();
        return;
      }
      //form validation

      if(!loginFormKey.currentState!.validate()){
        MFullScreenLoader.stopLoading();
        return;
      }

      //login user using email and password authentication
      final userCredential=await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //remove loader
      MFullScreenLoader.stopLoading();

      //redirect

      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
    }
  }
}