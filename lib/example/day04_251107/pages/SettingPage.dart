
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget{
  @override
  SettingPageState createState() => SettingPageState();
} // class end

class SettingPageState extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("설정"),),
      body: Text("설정 페이지"),
    );
  } // build end
} // class end