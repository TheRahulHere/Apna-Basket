import 'package:flutter/material.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/ele_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class MAppTheme{
  MAppTheme._(); // underscore means the private

   static ThemeData lightTheme = ThemeData(
     useMaterial3: true,
     fontFamily: 'Poppins',
     brightness: Brightness.light,
     primaryColor: Colors.blue,
     textTheme: MTextTheme.lightTextTheme,
     chipTheme: MChipTheme.lightChipTheme,
     scaffoldBackgroundColor: Colors.white,
     appBarTheme: MAppBarTheme.lightAppBarTheme,
     bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
     elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
     outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
     inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
   );
   static ThemeData darkTheme = ThemeData(
     useMaterial3: true,
     fontFamily: 'Poppins',
     brightness: Brightness.dark,
     primaryColor: Colors.blue,
     chipTheme: MChipTheme.darkChipTheme,
     textTheme: MTextTheme.darkTextTheme,
     scaffoldBackgroundColor: Colors.black87,
     appBarTheme: MAppBarTheme.darkAppBarTheme,
     bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
     elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
     outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
     inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
   );
}