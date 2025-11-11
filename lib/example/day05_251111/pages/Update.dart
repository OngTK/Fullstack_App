import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Update extends StatefulWidget {
  UpdateState createState() => UpdateState();
} // class end

class UpdateState extends State<Update> {
  // [1] 부모 위젯으로부터 매개변수 받기
  @override
  void didChangeDependencies() {
    int id = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    findById(id);
  } // didChangeDependencies func end

  // [2] to do 정보 가져오기
  dynamic todo = {};

  void findById(int id) async {
    try {
      final r = await dio.get("http://localhost:8080/api/todo/detail?id=${id}");
      final d = await r.data;
      print(d);
      setState(() {
        todo = d;
        titleCont.text = d['title'];
        contentCont.text = d['content'];
      });
    } catch (e) {
      print("[findById] 실패 ${e}");
    }
  }

  // [3] 입력상자 제어 Controller
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  // [4] Spring 서버에게 업데이트 요청
  void update() async {
    try {
      dynamic obj = {
        "id": todo['id'],
        "title": titleCont.text,
        "content": contentCont.text,
        "done" : todo['done']
      };

      final r = await dio.put("http://localhost:8080/api/todo", data: obj);
      final d = await r.data;
      if(d!=null){
        // 수정성공
        Navigator.pop(context, true);
        // 성공시 현재 위젯을 pop = 뒤로 가기
        // 반환값으로 true
      }
    } catch (e) {
      print("[update 실패] ${e}");
    }
  }

  // build 구현부 =============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do 수정")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(30),
        child: Column(
          children: [
            // maxLength 입력 길이 제한
            TextField(controller: titleCont, maxLength: 30),
            SizedBox(height: 20),
            // 긴 글을 입력받을 때, 속성
            TextField(
              controller: contentCont,
              maxLength: 255,
              maxLines: 5, // 최대 세로 길이 ,5줄 초과시 자동으로 스크롤바 생성
            ),
            SizedBox(height: 20),
            Text("완료 여부"),
            Switch(
              value: todo['done'],
              onChanged: (value) {
                setState(() {
                  todo['done'] = value;
                });
              },
            ),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {update();}, child: Text("수정하기")),
          ],
        ),
      ),
    );
  } // build end
} // class end
