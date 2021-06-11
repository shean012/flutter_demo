import 'package:flutter/material.dart';

// 首页页面
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Theme(
      data: ThemeData(primaryColor: Colors.orange),
      child: TextField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
      ),
    )));
  }
}
