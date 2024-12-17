import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/MformSignUp.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                "Let's create account ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              const MFormSignup(),
            ],
          ),
        ),
      ),
    );
  }
}