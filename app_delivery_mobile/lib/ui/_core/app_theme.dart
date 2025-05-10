import 'package:app_delivery_mobile/ui/_core/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.black),
      backgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.disabled)){
          return Colors.grey;
        } else if (state.contains(WidgetState.pressed)) {
          return const Color.fromARGB(111, 255, 164, 89);
        } else if (state.contains(WidgetState.hovered)) {
          return Colors.deepOrange;
        } else {
          return AppColors.mainColor;
        }
      }
    ),),
  ),
  );
}