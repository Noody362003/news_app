import 'package:flutter/material.dart';

import '../common/assets_manage.dart';
import '../common/routes_Manager.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3),
            (){
          Navigator.pushReplacementNamed(context, RoutesManager.home);
        }
    );
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Image(image: AssetImage(AssetsManager.logo),width: 200,height: 200,),

          ],
        ),
      ),
    );
  }
}
