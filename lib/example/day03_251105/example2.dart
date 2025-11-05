

/*
 * Java example2 > day02 goods와 통신
 * flutter day02 > example04의 state 관리 참고
 */

// [1] main ===================================================================
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
} // main end

// [2] 위젯 만들기 =============================================================
// 상태 없는 위젯
class MyApp extends StatelessWidget{

  // 위젯은 클레스 기반이므로
  // 위젯 생성 = 클래스 생성
  @override
  Widget build(BuildContext context) {  
    return MaterialApp( home: GoodsWidget() );
  } // build end

} // class end

// [3] 상태가 있는 위젯 =========================================================
// 컴포넌트
class GoodsWidget extends StatefulWidget {
  
  GoodsWidgetState createState() => GoodsWidgetState();
} // class end

// [4] 상태 하위 위젯
class GoodsWidgetState extends State<GoodsWidget>{
  
} // 침ㄴㄴ 둥