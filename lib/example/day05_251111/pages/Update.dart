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
    int id = ModalRoute.of(context)!.settings.arguments as int;
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

  // build 구현부 =============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do 수정")),
      body: Padding(padding: EdgeInsetsGeometry.all(30),
          child: Column(
            children: [
              // maxLength 입력 길이 제한
              TextField(controller: titleCont, maxLength: 30),
              TextField(controller: contentCont, maxLength: 255)

            ],
          )
      ),
    );
  } // build end
} // class end
