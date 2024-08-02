import 'package:flutter/material.dart';
import 'package:smart_agro/core/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 243, 227),
    // scaffoldBackgroundColor: const Color(0xffeae5c5),
    colorScheme: const ColorScheme.light(
      surface: Color.fromARGB(255, 255, 255, 255),
      error: Color(0xffb00020),
      errorContainer: Color(0xffb00020),
      inversePrimary: Color(0xffffffff),
      inverseSurface: Color(0xff000000),
      onPrimary: Color(0xff000000),
      primary: AppColors.primary,
      secondary: Color.fromARGB(255, 22, 92, 27),
      shadow: Color(0xff000000),
      surfaceTint: Color.fromARGB(255, 130, 229, 121),
      tertiary: Color(0xff03dac6),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
