import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppThemeMode {
  AppThemeMode._();

  static final ThemeData lightTheme = _theme(false);
  static final ThemeData darkTheme = _theme(true);

  static ThemeData _theme(bool darkMode) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkMode ? AppColors.blackSubtext : AppColors.white,
      ),
      primaryColor: darkMode ? AppColors.blackSubtext : AppColors.primaryGreen,
      scaffoldBackgroundColor: darkMode
          ? AppColors.blackSubtext
          : AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: darkMode ? AppColors.blackSubtext : AppColors.white,
        foregroundColor: darkMode ? AppColors.white : AppColors.black,
        iconTheme: IconThemeData(
          color: darkMode ? AppColors.white : AppColors.black,
        ),
        titleTextStyle: AppTextStyle.titleMedium(darkMode),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: darkMode ? AppColors.black : AppColors.white,
        scrimColor: darkMode ? Colors.black45 : Colors.black26,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkMode ? AppColors.blackSubtext : AppColors.white,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: darkMode ? Colors.grey.shade400 : Colors.grey,
        showUnselectedLabels: true,
      ),

      cardTheme: CardThemeData(
        surfaceTintColor: darkMode ? AppColors.lightGrey : AppColors.cardGreen,
        color: darkMode ? AppColors.blackText2 : AppColors.white,
        shadowColor: darkMode ? AppColors.grey5 : AppColors.grey4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyle.titleMedium(darkMode),
        bodySmall: AppTextStyle.bodySmall(darkMode),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: darkMode ? AppColors.white : AppColors.primaryGreen,
      ),
      cardColor: darkMode ? AppColors.blackSubtext : AppColors.white,
    );
  }
}
