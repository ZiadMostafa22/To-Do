import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/core/utils/color_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.blue,
        toolbarHeight: 120,
        titleTextStyle: AppLightStyles.appBarTextStyle,
      ),
      scaffoldBackgroundColor: ColorsManager.background,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsManager.blue,
          unselectedItemColor: ColorsManager.grey),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.blue,
        shape: StadiumBorder(
            side: BorderSide(
          color: ColorsManager.white,
          width: 4,
        )),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 20,
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      )));
}
