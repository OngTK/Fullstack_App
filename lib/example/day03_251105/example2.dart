import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/*
 * Java example2 > day02 goods와 통신
 * flutter day02 > example04의 state 관리 참고
 */

// [0] 통신용 DIO 객체
final dio = Dio();


// [1] main ===================================================================
void main() {
  runApp(MyApp());
} // main end

// [2] 위젯 만들기 =============================================================
// 상태 없는 위젯
class MyApp extends StatelessWidget {
  // 위젯은 클레스 기반이므로
  // 위젯 생성 = 클래스 생성
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GoodsWidget());
  } // build end
} // class end

// [3] 상태가 있는 위젯 =========================================================
// 컴포넌트
class GoodsWidget extends StatefulWidget {
  // 상태 위젯 등록
  GoodsWidgetState createState() => GoodsWidgetState();
} // class end

// [4] 상태 하위 위젯 ==========================================================
class GoodsWidgetState extends State<GoodsWidget> {

  // 입력상자 컨트롤러
  TextEditingController gnameCont = TextEditingController();
  TextEditingController gpriceCont = TextEditingController();
  TextEditingController gdescCont = TextEditingController();

  // 저장 버큰 func
  void goodsSave() async {
    final obj = {
      "gname": gnameCont.text,
      "gprice": gpriceCont.text,
      "gdesc" : gdescCont.text
    };
    try{
      // 주의!!
      // (1) 모바일에서는 HTTP가 없음!! localhost가 적용되지 않음
      // web으로 build 시 : localhost:8080 사용 가능
      // mobile build 시 : IP로 해야함 // 10.211.124.116
      // (2) web에서 Sprint controller에 cors 정책 파훼를 위한 어노테이션 추가
      // @CrossOrigin(origins =  "*")
      final res = await dio.post("http://10.211.124.116:8080/api/goods", data: obj);
      print(res.data);
    } catch(e){
      print("[통신실패] ${e}");
    }
  } // func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 영역
      appBar: AppBar(title: Text("Goods App Bar")),
      // 본문 영역
      body: Padding(
        // 모든 안쪽 여백 20
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: gnameCont,
              decoration: InputDecoration(labelText: "제품명"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: gpriceCont,
              decoration: InputDecoration(labelText: "제품가격"),
              keyboardType: TextInputType.number    // 모바일 환경에서 숫자 키보드로 제한
            ),
            SizedBox(height: 20),
            TextField(
              controller: gdescCont,
              decoration: InputDecoration(labelText: "제품설명"),
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: goodsSave , child: Text("등록")),
          ], // children end
        ), // Column end
      ), // body, padding end
    ); // Scaffold end
  } // build end
} // class end
