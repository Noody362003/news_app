import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/routes_Manager.dart';
import 'package:news/common/theme.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:news/screens/home.dart';
import 'package:news/screens/news_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(410, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: AppTheme.light,
          onGenerateRoute: RoutesManager.router,
          initialRoute: RoutesManager.splash,
        );
      },
      //child: Home(),
    );
  }
}

