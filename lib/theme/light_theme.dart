import 'package:flutter/services.dart';
import 'package:tatware/theme/widget_theme/bottom_nav_theme.dart';
import 'package:tatware/theme/widget_theme/text_theme.dart';

import '../../index.dart';
import '../util/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Constants.mainColor,
    brightness: Brightness.light,
    secondary: Constants.mainColor,
  ),
  iconTheme: IconThemeData(
    color: Constants.mainColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Constants.mainColor,
      fixedSize: Size(75.w, 7.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: Colors.transparent,
    centerTitle: false,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Constants.mainColor,
    foregroundColor: Colors.white,
  ),
  textTheme: textTheme,
  bottomNavigationBarTheme: bottomNavTheme,
);
