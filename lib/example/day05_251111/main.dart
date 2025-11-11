import 'package:flutter/material.dart';
import 'package:fullstack_app/example/day05_251111/pages/Detail.dart';
import 'package:fullstack_app/example/day05_251111/pages/Home.dart';
import 'package:fullstack_app/example/day05_251111/pages/Update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      // routes: {"경로" : (context) => 위젯() },
      routes: {
        "/": (context) => Home() ,
        "/detail": (context) => Detail(),
        "/update" : (context) => Update(),
      },
    );
  }
}
