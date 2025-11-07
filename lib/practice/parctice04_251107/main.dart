
import 'package:flutter/material.dart';
import 'package:fullstack_app/practice/parctice04_251107/MainPage.dart';

void main(){
  runApp(MyApp());
} // main end

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => MainPage(),
      },
    );
  }
}