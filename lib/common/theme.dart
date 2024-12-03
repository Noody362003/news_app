import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme{
  static ThemeData light=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: ColorsManager.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r),bottomRight: Radius.circular(50.r))),
      centerTitle: true,
      titleTextStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white,size: 30)
    ),

  );
}

class Style{
  static TextStyle drawerTitle=const TextStyle(fontWeight: FontWeight.w700,fontSize: 24,color: Colors.white,);
  static TextStyle drawerItem=const TextStyle(fontWeight: FontWeight.w700,fontSize: 24,);
  static TextStyle homeText=const TextStyle(fontWeight: FontWeight.w700,fontSize: 22);
  static TextStyle categoryText=const TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.white);

}