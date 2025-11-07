import 'package:flutter/material.dart';
import 'package:fullstack_app/practice/parctice04_251107/GetPage.dart';
import 'package:fullstack_app/practice/parctice04_251107/PostPage.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
} // class end

class MainPageState extends State<MainPage> {
  // 현재 화면에 보이는 페이지 인덱스
  int currentPageIndex = 0;

  // 인덱스 별 위젯 목록
  dynamic pages = [
    PostPage(),
    GetPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "등록"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "조회")
        ],
      ),
    );
  }
} // class end
