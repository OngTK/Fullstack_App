import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} // main end

// [1] 플러터 앱의 시작점 위젯
// 시작점만 상태가 없는
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IOwidget(), // [2] 내가 만든 상태 위젯 연결
    );
  } // build end
} // class end

// [2] 상태가 있는 위젯
class IOwidget extends StatefulWidget {
  // [2.1] 현재 위젯을 상속받은 하위 위젯을 등록
  IOwidgetState createState() => IOwidgetState();
} // class end

// [3] 상태 하위 위젯
class IOwidgetState extends State<IOwidget> {
  // TextField 로 부터 입력받은 값들을 제어하는 제어 변수
  // TextEditingController => react의 useState
  // 입력상자 1개 당 1개의 controller 필요
  TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();

  // onPressed 등록 함수
  void onSave() {
    print(nameCont.text); // 컨트롤러의 텍스트 값을 가져옴
    print(ageCont.text);

    dynamic obj = {"name": nameCont.text, "age": ageCont.text};
    print(obj);
  } // func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("입출력 실습")),
      body: Column(
        children: [
          TextField(
            controller: nameCont,
            decoration: InputDecoration(labelText: "이름을 입력하세요."),
          ), //input 박스
          TextField(
            controller: ageCont,
            decoration: InputDecoration(labelText: "나이를 입력하세요."),
          ),
          TextButton(onPressed: onSave, child: Text("등록")),
        ],
      ),
    );
  } // build end
} // class end
