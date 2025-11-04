// [1] 상태(State)가 있는 위젯
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// [1.1] StatefulWidget : 상태가 있는 위젯 상속
class MyApp extends StatefulWidget {
  // [1.2] 상태를 관리할 하위 위젯을 등록
  // 등록할 위젯명 createState() => 등록할위젯명
  MyAppState createState() => MyAppState();
} // class end

// [2] 상태를 사용하는 위젯을 선언
// [2.1] class 하위 위젯 extends State<상위위젯>
class MyAppState extends State<MyApp> {
  int count = 0;
  int count2 = 0;

  // ************ 상태변경 = 재렌더링
  void incremnet(){
    // setState(() { 새로운 반환 값 });
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
       appBar: AppBar(title: Text("상단 제목"),),
       body: Center(
        child: Column(
         children: [
           Text("count : ${ count }"),
           Text("세로 정렬 두번째 위젯"),
           TextButton(onPressed: incremnet, child: Text("버튼"))
         ],
        )
       )
      )
    );
  } // build end
} // class end