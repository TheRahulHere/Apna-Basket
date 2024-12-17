import 'package:application/bindings/general_binding.dart';
import 'package:application/utils/constants/colors.dart';
import 'package:application/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      initialBinding:GeneralBinding(),
      home:const Scaffold(backgroundColor: MColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }
}
