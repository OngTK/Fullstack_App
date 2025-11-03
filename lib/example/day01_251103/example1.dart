import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// example1.dart

// void : 반환타입이 없음
// void main :  최초 실행
// 위젯 : 화면을 구성하는 가장 작은 단위 (react의 컴포넌트)

// [1] 위젯 만들기
// [1.1] StatelessWidget 상속
class MyApp1 extends StatelessWidget {
  // [1.2] build를 override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text("최초 위젯"));
  } // build end
} // class end

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Java : new 클래스명(값)
    // dart : 클래스명(속성명 : 값)
    // return MaterialApp( home: 출력할 위젯);
    // return MaterialApp( home: Scaffold( 속성명: 값, 속성명: 값, ... ) ,  );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("상단바 영영") ),
        body: Center( child: Text("본문 영역") ),
        bottomNavigationBar: BottomAppBar( child: Text("하단바") ),
      ), // scaffold End
    ); // MaterialApp end
  } // build end
} // class end

void main() {
  // public static void main(){}
  print("dart입니다."); // java의 System.out.print()
  // 실행할 위젯을 선언
  // runApp은 1개만 가능
  // runApp(MyApp1());
  runApp(MyApp2());
} // void and
