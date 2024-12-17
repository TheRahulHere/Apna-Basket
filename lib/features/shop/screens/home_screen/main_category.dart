// import 'package:flutter/material.dart';
//
// class categories extends StatelessWidget {
//   const categories({
//     super.key,
//     required this.image, this.onTap,
//   });
//   final String image;
//   final VoidCallback? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(7),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           width: 200,
//           height: 280,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image:
//               DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
//         ),
//       ),
//     );
//   }
// }