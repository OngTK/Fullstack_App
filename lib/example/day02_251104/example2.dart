import 'package:flutter/material.dart';

// [2] 최초로 실행할 위젯
void main() {
  runApp(MyApp());
}

// [1] 상태가 없는 위젯 = 재 렌더링이 없을 때
// [1.1] StatelessWidget 상속
class MyApp extends StatelessWidget {
  // [1.3] 버튼용 이벤트
  int count = 0;
  void increment() {
    count++;
    print(count);
  }

  // [1.2] build 함수 오버라이드
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Text("안녕하세요."));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("상단 제목")),
        body: Center(
          // Center() : 가운데 정렬
          child: Column(
            // Column() : 세로로 쌓기
            children: [
              Text("세로 정렬 첫번째 위젯"),
              Text("세로 정렬 두번째 위젯"),
              TextButton(onPressed: increment, child: Text("세로 정렬 세번째 위젯")),
              Text("세로 정렬 네번째 위젯 count : ${count}") // useState를 사용하지 않아서 console에서는 증가하나 화면은 랜더링되지 않음
            ],
          ),
        ),
      ),
    );
  } // build end
} // class end
