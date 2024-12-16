import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isArabic=false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: const Text('Arabic',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
        activeColor: Colors.green,
        //activeTrackColor: Colors.,
        value: isArabic,
        onChanged: (value){
          isArabic=value;
          setState(() {

          });
        });
  }
}
