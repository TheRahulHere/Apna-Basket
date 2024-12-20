import 'package:flutter/material.dart';

class MTextTheme {
  MTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),

    titleLarge:const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87) ,
    titleMedium:const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87) ,
    titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),

    bodyLarge:const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w500, color: Colors.black87) ,
    bodyMedium:const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black87) ,
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87),
    labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87.withOpacity(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
      headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),

    titleLarge:const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white) ,
    titleMedium:const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white) ,
    titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),

    bodyLarge:const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w500, color: Colors.white) ,
    bodyMedium:const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white) ,
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
  );
}
