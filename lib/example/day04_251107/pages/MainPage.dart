import 'package:flutter/material.dart';
import 'package:fullstack_app/example/day04_251107/pages/HomePage.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
} // class end

class MainPageState extends State<MainPage> {
  // 현재 화면에 보이는 페이지 번호 = 인덱스
  int currentPageIndex = 0;

  // 인덱스 별 위젯(페이지) 목록
  // List<Widget> == dynamic page
  dynamic page = [
    HomePage(), // index 0 > 홈페이지
  ]; // page end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        // items 바텀 메뉴에 들어갈 버튼들
        currentIndex: currentPageIndex,
        // 바텀 메뉴 중 하나의 탭을 눌렀을 때의 이벤트
        onTap: (index){setState(() {
          currentPageIndex = index;
        });},
        // 바텀 메뉴에 들어갈 버튼들
        items: [
          BottomNavigationBarItem( icon: Icon(Icons.home), label: "홈" )], // 0번
      ),
    );
  } // build end
} // class end
