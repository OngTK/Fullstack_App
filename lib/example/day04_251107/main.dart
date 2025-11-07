import 'package:flutter/material.dart';
import 'package:fullstack_app/example/day04_251107/pages/HomePage.dart';
import 'package:fullstack_app/example/day04_251107/pages/InfoPage.dart';
import 'package:fullstack_app/example/day04_251107/pages/MainPage.dart';

void main() {
  runApp(MyApp());
} // main end

// MyApp() : 내가 만튼 루트(최초) 위젯, new 생략 가능
// 앱 존체의 루트 위젯 정의
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // routes: {"경로명":(context)=>위젯명()}
    return MaterialApp(
      // 최초 경로 Route
      initialRoute: "/",
      // 경로와 해당 위젯을 연결하는 MAP
      routes: {
        "/": (context) => MainPage(),
        "home" : (context) => HomePage(),
        "info" : (context) => InfoPage(),
      }, // routes end
    ); // MaterialApp end
  } // build end
} // class end
