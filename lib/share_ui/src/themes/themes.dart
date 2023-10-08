import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../text_styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
          titleTextStyle: TextStyles.smallBody16SemiBold,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyles.caption10Regular,
          unselectedLabelStyle: TextStyles.caption10Regular,
          unselectedItemColor: AppColors.labelTertiary,
        ),
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.zero,
          labelColor: AppColors.black,
          labelStyle: TextStyles.smallBody16Medium,
          unselectedLabelColor: AppColors.textQuarternary,
          unselectedLabelStyle: TextStyles.smallBody16Medium,
        ),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        scaffoldBackgroundColor: AppColors.white,
      );
}
