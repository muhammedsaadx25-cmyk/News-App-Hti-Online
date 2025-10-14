import 'package:flutter/cupertino.dart';
import 'package:news_app_hti_online/features/home/home.dart' show Home;
import 'package:news_app_hti_online/features/splash/splash.dart';

abstract class RoutesManager{
  static const String splash = '/splash';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash : (_)=> Splash(),
    home : (_)=> Home(),
  };
}