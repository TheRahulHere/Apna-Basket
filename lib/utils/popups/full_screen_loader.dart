// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:internship/common/widgets/loaders/animation_loader.dart';
// import 'package:internship/utils/constants/colors.dart';
// import 'package:internship/utils/helpers/helper_function.dart';
//
// class MFullScreenLoader{
//   static void openLoadingDialog(String text,String animation){
//     showDialog(context: Get.overlayContext!,
//         barrierDismissible: false,
//         builder: (_)=>WillPopScope(
//            // canPop: false,
//             onWillPop: () async {
//               return false;
//             },
//             child: Container(
//               color: MHelper.isDarkMode(Get.context!)?MColors.dark:MColors.white,
//               width: double.infinity,
//               height: double.infinity,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 250,),
//                   MAnimationLoaderWidget(text: text, animation: animation),
//                 ],
//               ),
//             )
//         )
//     );
//   }
//
//   static stopLoading(){
//     Navigator.of(Get.overlayContext!).pop();
//   }
// }
