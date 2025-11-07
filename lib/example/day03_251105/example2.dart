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
      "gdesc": gdescCont.text,
    };
    try {
      // 주의!!
      // (1) 모바일에서는 HTTP가 없음!! localhost가 적용되지 않음
      // web으로 build 시 : localhost:8080 사용 가능
      // mobile build 시 : IP로 해야함 // 10.211.124.116
      // (2) web에서 Sprint controller에 cors 정책 파훼를 위한 어노테이션 추가
      // @CrossOrigin(origins =  "*")
      final res = await dio.post(
        "http://10.211.124.116:8080/api/goods",
        data: obj,
      );
      print(res.data);

      // 저장 성공된 자료를 goodsList에 추가하여 재랜더링
      // or goodsAll을 재실행
      goodsAll();
    } catch (e) {
      print("[통신실패] ${e}");
    }
  } // func end

  // 전체 조회 DIO
  // 위젯이 열렸을 때 최초 1회 실행
  void goodsAll() async {
    try {
      final res = await dio.get("http://10.211.124.116:8080/api/goods/all");
      print(res.data);
      // 통신 결과를 함수 밖 변수(상태)에 업데이트
      goodsList = res.data;
    } catch (e) {
      print("[통신실패] ${e}");
    }
  } // func end

  // [**] initState() 함수 오버라이딩으로 위젯 초기 상태
  // 현재 위젯이 최초 실행될 때, 1번만 goodsAll()을 실행
  void initState() {
    goodsAll();
  } // func end

  // dio get 통신 결과를 저장하는 상태 변수
  dynamic goodsList = [];

  // build
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
              keyboardType: TextInputType.number, // 모바일 환경에서 숫자 키보드로 제한
            ),
            SizedBox(height: 20),
            TextField(
              controller: gdescCont,
              decoration: InputDecoration(labelText: "제품설명"),
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: goodsSave, child: Text("등록")),
            SizedBox(height: 50),

            // data가 많을 때, 확장을 시킴
            Expanded(
              child: ListView.builder(
                itemCount: goodsList.length,    // 리스트의 총 개수 정의
                // 반복문
                itemBuilder: (context, index) {
                  dynamic goods = goodsList[index]; // index 번째 굿즈 1개를 가져옴
                  return Card(
                    child: ListTile(
                      title: Text(goods["gname"]),
                      subtitle: Text(goods["gdesc"]),
                    ),
                  );
                },
              ),
            ),
          ], // children end
        ), // Column end
      ), // body, padding end
    ); // Scaffold end
  } // build end
} // class end
