import 'package:application/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/onBoarding/on.png'),
              fit: BoxFit.contain)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Start Shopping"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
