import 'package:application/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/login_controller.dart';
import '../../sighUp/signup.dart';


class MFormLogin extends StatelessWidget {
  const MFormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return  Form(
      key: controller.loginFormKey,
      child: Padding(padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value)=> MValidator.validateEmail(value),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.black,
                  suffixIcon: const Icon(Icons.email,color: Colors.black87,),
                  hintText: "Enter Your E-mail",
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black,decorationColor: Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black
                  )
                )
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields,),
            Obx(
              ()=>  TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value)=>MValidator.validateEmptyText( 'Password',value),
                style: const TextStyle(color: Colors.black),
                decoration:  InputDecoration(
                  fillColor: Colors.black,
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value?Icons.visibility:Icons.visibility_off),
                      color: Colors.black87,
                      onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    ),
                   hintText: "Enter Your Password",
                    hintStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Colors.black
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Colors.black
                      )
                  )
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwSections),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.emailAndPasswordSignIn(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
                child: const Text("SignIn"),),),
            const SizedBox(height: MSizes.spaceBtwItems),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(()=>const SignupScreen()),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
              child: const Text("Create Account"),),),
            const SizedBox(height: MSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
