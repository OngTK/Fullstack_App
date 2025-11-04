// Dart 기본 문법

void main() {
  // [1] 기본타입 ======================================================================
  int age = 25; // 정수 int
  print("나이 : ${age}"); // print(): 출력함수 // "문자열 ${변수명}"

  double height = 175.5; // 실수 double
  bool isStudent = false; // 논리 bool
  String name = "유재석"; // 문자열 String

  print("이름: ${name}, 키: ${height}, 학생여부: ${isStudent}");

  // [2] 주요 변수/상수 키워드 ======================================================================
  var city = "서울"; // js 처럼 var을 이용하여 자동 타입 추론 - 타입변경 불가능
  dynamic count = 123; // 자동 타입 추론 + 타입변경가능 ****
  count = "123"; // String으로 타입 변경

  const PI = 3.14159; // const 상수 -> 런타임 중에 상수처리
  final country = "대한민국"; // final 상수 -> 컴파일 시 상수 처리

  // [3] List, Map, Set 컬렉션 ======================================================================
  List<String> fruits = ["사과", "바나나", "포도"]; // 앞은 Java, 뒤는 Script 같음
  fruits.add("딸기");
  print("과일목록 : ${fruits}");

  Map<String, int> score = {"국어": 90, "수학": 95, "영어": 93};
  // dart에는 wrapper클래스가 없고, 기본 클래스를 제네릭자리에 삽입 가능
  print("점수목록 : ${score}");

  Set<int> number = {1, 2, 3, 4, 1, 2}; // Set : 중복이 없는 집합
  print("중복 없는 집합 : ${number}");

  // [4] 함수 ======================================================================
  // [4.1]
  // 반환타임 함수명(매개변수타입 매개변수명,...){ 실행 부분 }
  int add(int a, int b) {
    return a + b;
  }

  int result = add(3, 5);
  print("두수의 합 : ${result}");

  // [4.2] 익명 함수
  // 반환타입 함수명 = ( 매개변수 ){ 실행부 }
  var multiply = (int x, int y ){ return x * y; };
  print( "두수의 곱 : ${multiply(3,5)}" );

  // [5] 클래스 · 객체 ==================================================================

  // [5.2] 객체
  // 객체 선언시 new 없어도 됨
  Person p1 = new Person("유재석", 50);
  Person p2 = Person("강호동", 54);

  // 위젯 : 미리 만들어진 클래스 또는 내가 만튼 클래스
  // new 위젯명(속성, 속성값)
  // new 생략가능

  // [6] null 갖는 타입 > 타입? : 타입명 뒤에 >
  String? nickname; //null 허용
  nickname=null;
  print("닉네입 : ${ nickname ?? '미정' } ");
} // main end

// [5.1] 클래스
// class 클래스명{}
class Person{

  // 멤버변수
  String name;
  int age;

  // 생성자
  Person(this.name, this.age);

} // class end