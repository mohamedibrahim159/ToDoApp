

import 'dart:ui';

import 'package:flutter/material.dart';

class my_theme {
  static Color primaryLightcolor= Color(0xff5D9CEC);
  static Color whitecolor= Color(0xffffffff);
  static Color blackcolor= Color(0xff363636);
  static Color greencolor= Color(0xff61E757);
  static Color backgroundlightcolor= Color(0xffDFECDB);
  static Color backgroundDarkcolor= Color(0xff060E1E);
  static Color redcolor= Color(0xffEC4B4B);
  static Color greycolor= Color(0xffADAEAF);
static ThemeData lightTheme=ThemeData(
  primaryColor: primaryLightcolor,
  scaffoldBackgroundColor: backgroundlightcolor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryLightcolor,
    elevation: 0,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: whitecolor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
selectedItemColor: primaryLightcolor,
    unselectedItemColor: greycolor,
    backgroundColor: whitecolor,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1
      ),
  borderRadius: BorderRadius.only(
  topRight: Radius.circular(45),
    topLeft: Radius.circular(45)
)
  ),
  )
);
}