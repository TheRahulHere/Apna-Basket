import 'package:flutter/cupertino.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 250,
        width: 182,
        child: Positioned(
          child: Container(
            height:200,
            width: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/popular/kaju.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
        ),
      ),
    );
  }
}
