import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("더조은 : 앱"),),
      body: Center(
        child: ElevatedButton(
          // Navigator.pushNamed(context, "이동할 라우트 경로")
            onPressed: (){ Navigator.pushNamed( context , "/detail");},
            child: Text("특정 페이지로 이동")
        ),
      ),
    );
  } // build end
} // class end