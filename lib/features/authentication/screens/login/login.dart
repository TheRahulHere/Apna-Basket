import 'package:application/features/authentication/screens/login/widgets/form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/spacing_style.dart';
import '../../../../utils/helpers/helper_function.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelper.isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("assets/images/onBoarding/log.png"),fit: BoxFit.cover
                )
            ),
        child:
          const Padding(
            padding: MSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo,Title & SubTitle
                  /// Form
                  MFormLogin(),
                ],
              ),
            ),
        ),
    );
  }
}


