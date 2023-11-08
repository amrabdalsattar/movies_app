import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

abstract class AppTheme{
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColor.primary,
    canvasColor: AppColor.backGroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColor.primary,
      unselectedItemColor: AppColor.unselectedTabColor,
      showUnselectedLabels: true
    )

  );
}