import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/repositories/user/user_repository.dart';
import '../../../utils/validators/network_manager.dart';
import '../../../utils/validators/user_model.dart';
import '../screens/sighUp/email_phone_verification.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final hidePass = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  // Sign up
  void signup() async {
    try {
      //start loading
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...');
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }
        //form validator
        if (!signupFormKey.currentState!.validate()) {
          MFullScreenLoader.stopLoading();
          return;
        }

        // register user in firebase authentication
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        // save the authenticate user in the firebase FireStore
        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        MFullScreenLoader.stopLoading();

        //show success message
        MLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your account has been created! verify email to continue');

        // move to verify email screen

        Get.to(() => VerifyUser(email: email.text.trim(),));

    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
