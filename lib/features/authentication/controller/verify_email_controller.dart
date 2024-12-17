import 'dart:async';

import 'package:application/common/widgets/loaders/loaders.dart';
import 'package:application/features/authentication/screens/sighUp/start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/repositories/authentication/authentication_repository.dart';

class VerifyEmail extends GetxController{
  static VerifyEmail get instance => Get.find();

  //send email whenever verify screen appears and set timer for auto redirect

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
 /// send email verification link
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      MLoaders.successSnackBar(title: 'Email sent',message: 'Please check your inbox and verify email');
    }catch(e){
      MLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
    }
  }

  /// timer to automatically redirect on email verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 2), (timer)async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user?.emailVerified?? false){
        timer.cancel();
        Get.off(()=> const StartPage());
      }
    }
    );
  }

   /// manually check if email verified
  checkEmailVerificationStatus()async{
    final currentUser=FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(()=> const StartPage());
    }
  }
}