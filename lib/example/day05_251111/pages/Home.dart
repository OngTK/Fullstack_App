import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
} // class end

class HomeState extends State<Home> {
  // [1] 위젯 최초 실행시 실행 함수 : initState()
  void initState() {
    findAll();
  } // initState func end

  List<dynamic> todoList = [];

  // [2] To do 전체 목록 가져오기 : findAll()
  void findAll() async {
    try {
      final r = await dio.get("http://localhost:8080/api/todo");
      // mobile 실행시 localhost가 아니라 ip 주소를 삽입
      final d = await r.data;
      setState(() {
        todoList = d;
      });
    } catch (e) {
      print("[findAll 실패] ${e}");
    }
  } // findAll func end

  // [3] to do 개별 삭제
  void delete(int id) async {
    try {
      final r = await dio.delete("http://localhost:8080/api/todo?id=${id}");
      final d = await r.data;

      if (d) {
        // 삭제 성공
        findAll(); // 목록 조회 or 재랜더링
      }
    } catch (e) {
      print("[delete 실패] ${e}");
    }
    ;
  } // delete func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      body: Center( // 가운데 정렬
        child: Column(  // 세로 정렬
          children: [ Expanded( // 확장형 스크롤 제공
            child: ListView(
              // 반복문을 이용하여 ListView에 여러 개의 Card를 대입
              // todoList.map( ( 반복변수명 ){ return 반환위젯( ) } ).toList()
              children: todoList.map( (todo) {
                // map 반복문은 dynamic 타입을 지원하지 않음
                return Card(
                  child: ListTile(
                    title: Text(todo['title']),
                    trailing:Row( // 가로정렬 / 가로 배치 위젯
                      // row 배치에서 오른쪽 버튼들의 넓이를 자동으로 최소 크기로 할당
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 삭제 버튼
                        IconButton(onPressed: (){delete(todo['id']);}, icon: Icon(Icons.delete)),
                        // 수정 버튼
                        IconButton(onPressed: (){ Navigator.pushNamed(context, "/update",arguments: todo['id']);}, icon: Icon(Icons.update)),
                        // 상세 버튼
                        // 위젯 간의 매개변수 전달 필요
                        // Navigator.pushNamed(context, "/detail", arguments: 매개변수 );
                        // context : 현재 위젯
                        // "/detail" : 이동할 위젯 경로
                        // arguments : 매개변수 전달
                        IconButton(onPressed: (){ Navigator.pushNamed(context, "/detail", arguments: todo['id'] );}, icon: Icon(Icons.info))
                      ],
                    ),
                  ),
                );
              } ).toList(), // map end
            ),
          ),
        ],)
      ),
    );
  } // build end
} // class end
