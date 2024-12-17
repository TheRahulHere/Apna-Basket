import 'package:flutter/material.dart';
import '../utils/helpers/helper_function.dart';

class MyRichText extends StatelessWidget {
   const MyRichText({
    super.key,
     this.mText,
     this.mText1,
     this.mText2,
     this.mText3
  });
  final String? mText;
  final String? mText1;
  final String? mText2;
  final String? mText3;
  @override
  Widget build(BuildContext context) {
    final dark=MHelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12,top: 5,bottom: 5),
      child: RichText(
          text:  TextSpan(
            style:  const TextStyle(
            ),
            children: <TextSpan>[
              TextSpan(text:mText,style: const TextStyle(
                  color:Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: mText1,style: TextStyle(
                color: dark? Colors.white:Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              )
              ),
              TextSpan(text:mText2,style: const TextStyle(
                  color:Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: mText3,style: TextStyle(
                  color: dark? Colors.white:Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
              ),

            ]
          ),

      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:internship/utils/helpers/helper_function.dart';

RichText myText(){
  return RichText(
    text: const TextSpan(
        style: TextStyle(
          color: Colors.black87,
          fontSize: 25,
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'Apna',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Basket',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
  );
}

 */