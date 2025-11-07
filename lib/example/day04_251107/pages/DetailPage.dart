
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 정보 페이지'),
      ),
      body: Center(
          child: Column(
            children: [
              Text("상세 페이지"),
              ElevatedButton(
                  onPressed: (){ Navigator.pop(context); }
                  , child: Text("뒤로가기")
              )
            ],
          )
      )
    );
  }
} // class end
