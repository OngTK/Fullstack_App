import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class GetPage extends StatefulWidget{
  GetPageSate createState() => GetPageSate();
}

class GetPageSate extends State<GetPage>{

  // 조회할 list 초기화
  dynamic TodoList = [];

  // 전체 조회 Dio
  void getTodoList() async{
    try{
      final r = await dio.get("http://192.168.137.1:8080/api/todo");
      print(r.data);
      TodoList = r.data;
    }catch(e){
      print("[getTodoList 통신 실패] ${e}");
    }
  } // func end

  // 최초 실행
  void initState(){
    getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 조회"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: getTodoList, child: Text("새로고침")),
          Expanded(child: ListView.builder(
              itemCount: TodoList.length,
            
            // 반복문
            itemBuilder: (context, index) {
              dynamic todo = TodoList[index];
              return Card(
                child: ListTile(
                  title: Text(todo["title"]),
                  subtitle: Text(todo["content"]),
                ),
              );
            },
          )
          )
        ],
      ),
    );
  }
}