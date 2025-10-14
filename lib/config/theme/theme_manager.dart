import 'package:flutter/material.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
  );
}