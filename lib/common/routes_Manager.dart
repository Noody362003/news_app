import 'package:flutter/material.dart';
import 'package:news/screens/home.dart';
import 'package:news/screens/news_details.dart';
import 'package:news/screens/splash.dart';


class RoutesManager{
  static const String home='/home';
  static const String articleDetails='/article';
  static const String splash='/splash';

  static Route? router(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context)=>Splash());
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case articleDetails:
        return MaterialPageRoute(settings : settings,builder: (context)=>ArticleDetails());

    }
  }
}