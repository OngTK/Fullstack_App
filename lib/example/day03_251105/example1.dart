import 'package:dio/dio.dart';

/*
 * [ Java와 통신  = DIO]
 * JS : Fetch
 * JQuery : AJAX
 * REACT : Axios
 * ** Flutter : DIO **
 *
 * ---
 * https://pub.dev/
 * Flutter 라이브러리 공유 페이지
 * pubspec.yaml > dependencies : 라이브러리 관리
 *
 * -- DIO 추가하기
 * pubspec.yaml > dependencies
 * `  dio: ^5.9.0 ` 추가하기
 * 우측 상단 [Pub Get] 클릭 = 라이브러리 설치
 */

final dio = Dio();
// dio 상수에 Dio 통신 객체를 저장

// [1] get 방식의 요청 함수 =====================================================
void getEvent() async {
  try {
    final response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts/1"
    );
    print("[Get] 성공: ${response}");
  } catch (e) {
    print("[Get] 실패: ${e}");
  }
} // func end

// [2] POST 방식의 요청 함수 ====================================================
void postEvent() async {
  try {
    final obj = {
      "title": "foo",
      "body": "bar",
      "userId": 1
    };
    final response = await dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: obj
    );
    print("[POST] 성공 : ${response.data}");
  } catch (e) {
    print("[POST] 실패: ${e}");
  }
}

// main =======================================================================
void main() {
  print("DART 프로그램 시작점");

  postEvent();
  getEvent();
} // main end
