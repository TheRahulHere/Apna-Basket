import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/signUp_controller.dart';

class MFormSignup extends StatelessWidget {
  const MFormSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) => MValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "First name",
                      prefixIcon: Icon(Icons.perm_identity_sharp)),
                )),
                const SizedBox(
                  width: MSizes.spaceBtwInputFields,
                ),
                Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      validator: (value)=> MValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Last name",
                      prefixIcon: Icon(Icons.perm_identity_sharp)),
                ))
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value)=> MValidator.validateEmptyText('Username', value),
             controller: controller.username,
              decoration: const InputDecoration(
                  labelText: "Username", prefixIcon: Icon(Icons.man)),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value)=> MValidator.validateEmail(value),
             controller: controller.email,
              decoration: const InputDecoration(
                  labelText: "E-mail", prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            TextFormField(

              validator: (value)=>MValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,

              decoration: const InputDecoration(
                  labelText: "Phone Number", prefixIcon: Icon(Icons.phone)),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            Obx(
             ()=> TextFormField(
                validator: (value)=>MValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePass.value,
                decoration:  InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(

                      onPressed: () => controller.hidePass.value=!controller.hidePass.value,
                      icon: Icon(controller.hidePass.value?Icons.visibility_off:Icons.remove_red_eye),
                        )
                ),
              ),
            ),

            const SizedBox(height: MSizes.spaceBtwInputFields),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Create Account")),
            )
          ],
        ));
  }
}
