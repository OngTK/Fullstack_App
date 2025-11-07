import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_app/practice/parctice04_251107/GetPage.dart';

final dio = Dio();

class PostPage extends StatefulWidget {
  PostPageState createState() => PostPageState();
} // class end

class PostPageState extends State<PostPage> {

  // controller
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  // 등록 함수
  void createTodo()async{
    final obj = {
      "title": titleCont.text,
      "content": contentCont.text,
    };
    try{
      final res = await dio.post("http://192.168.137.1:8080/api/todo",data: obj);
      print(res.data);
    }catch(e){
      print("[createTodo 실패] ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TODO 등록"),),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: titleCont,
                decoration: InputDecoration(labelText: "TODO 이름"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: contentCont,
                decoration: InputDecoration(labelText: "TODO 설명"),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: createTodo, child: Text("등록"))
            ],
          ),
        )
    );
  }
} // class end