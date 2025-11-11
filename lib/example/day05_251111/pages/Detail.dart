
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();
} // class end

class DetailState extends State<Detail>{

  // [1] 최초 실행시 랜더링
  void initState(){  } // initStat func end

  // [2] 부모 위젯이 변경되었을 때, 실행되는 함수
  @override
  void didChangeDependencies() {
    // 부모위젯에서 상세 버튼을 클릭할 때 마다, 매개변수를 가져옴
    // ModalRoute.of(context)!.settings.arguments as 타입 ;
    int id = ModalRoute.of(context)!.settings.arguments as int;
    print(id);
    findById(id);
  } // didChangeDependencies func end

  // [3] 서버로부터 개별 조회
  dynamic todo = {} ;
  void findById( int id ) async {
    try{
      final r = await dio.get("http://localhost:8080/api/todo/detail?id=${id}");
      final d = await r.data;
      print(d);
      setState(() {
        todo = d;
      });
    }catch(e){
      print("[findById] 실패 ${e}");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("상세 정보")),
      body: Text("내용"),
    );
  } // build end
} // class end