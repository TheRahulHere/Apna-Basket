import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import 'animation_loader.dart';

class MFullScreenLoader{
  static void openLoadingDialog(String text){
    showDialog(context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=> PopScope(
            canPop: false,
            child: Container(
              color: MHelper.isDarkMode(Get.context!)?MColors.dark:MColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  MAnimationLoaderWidget(text: text),
                ],
              ),
            )
        )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
