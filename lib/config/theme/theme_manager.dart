import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)

    ),
    scaffoldBackgroundColor: ColorsManager.black,
  );
}