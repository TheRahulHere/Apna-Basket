import 'package:application/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:application/features/authentication/controller/verify_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_function.dart';
class VerifyUser extends StatelessWidget {
  const VerifyUser({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyEmail());
    final dark=MHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=>AuthenticationRepository.instance.logout(), icon: const Icon(Icons.clear))],
      ),
      resizeToAvoidBottomInset: false,
      body:
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/onBoarding/log.png'),
              fit: BoxFit.cover
            )
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Email link sent successfully'),
              const SizedBox(height: 20,),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                    onPressed: () =>controller.checkEmailVerificationStatus(),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Verify')),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: ()=> controller.sendEmailVerification(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child:const  Text('Resend Email?'),
                ),
              )
            ],
          ),

        )
    );
  }
}
