import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/colors.dart';
import 'package:news/common/theme.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.selected});
  final Function(DrawerItem) selected;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 120.h,
            width: double.infinity,
            color: ColorsManager.primary,
            child: Center(child: Text('News App!',style: Style.drawerTitle,)),
          ),
          ListTile(
            onTap: (){
              selected(DrawerItem.categories);
              Navigator.of(context).pop();
            },
            leading: const Icon(Icons.list,size: 35,),
            title: Text('Categories',style: Style.drawerItem,),
          ),
          ListTile(
            onTap: (){
              selected(DrawerItem.settings);
              Navigator.of(context).pop();
            },
            leading: const Icon(Icons.settings,size: 30,),
            title: Text('Settings',style: Style.drawerItem,),
          )
        ],
      ),
    );
  }
}

enum DrawerItem{
  categories,settings
}
