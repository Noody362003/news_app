import 'package:flutter/material.dart';
import 'package:news/screens/catigories/categories.dart';
import 'package:news/screens/catigories/category_details.dart';
import 'package:news/screens/settings/settings.dart';

import '../common/assets_manage.dart';
import '../common/custom_Drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DrawerItem drawerSelected = DrawerItem.categories;
  String? selectedCatId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('News App'),
        ),
        drawer: CustomDrawer(
          selected: (value) {
            drawerSelected = value;
            selectedCatId=null;
            setState(() {});
          },
        ),
        body: selectedCatId!=null
            ?CategoryDetailsView(id: selectedCatId!)
            : drawerSelected == DrawerItem.categories
            ? Categories(selected: (value){
              selectedCatId=value;
              setState(() {
              });
        },)
            : const Settings(),
      ),
    );
  }
}
