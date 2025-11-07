import 'package:flutter/material.dart';
import 'package:fullstack_app/example/day04_251107/pages/HomePage.dart';
import 'package:fullstack_app/example/day04_251107/pages/InfoPage.dart';
import 'package:fullstack_app/example/day04_251107/pages/SettingPage.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
} // class end

class MainPageState extends State<MainPage> {
  // 현재 화면에 보이는 페이지 번호 = 인덱스
  int currentPageIndex = 0;

  // 인덱스 별 위젯(페이지) 목록
  // List<Widget> == dynamic page
  dynamic pages = [
    HomePage(),     // index 0 > 홈페이지
    InfoPage(),     // index 1 > 정보 페이지
    SettingPage(),  // index 2 > 설정 페이지
  ]; // page end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ** Stack!!
      body: IndexedStack(index: currentPageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        // items 바텀 메뉴에 들어갈 버튼들
        currentIndex: currentPageIndex,
        // 바텀 메뉴 중 하나의 탭을 눌렀을 때의 이벤트
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // 바텀 메뉴에 들어갈 버튼들
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromRGBO(1, 101, 101, 0.5),),
              label: "홈"
          ), // 0번
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 30),
            label: "정보",
          ), // 1번
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.blue,),
              label: "설정"
          ) // 2번
        ],
      ),
    );
  } // build end
} // class end
