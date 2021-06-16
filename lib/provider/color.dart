import 'package:flutter/material.dart';

class SelectColor with ChangeNotifier {
  String _color = 'red';
  Color _btnColor = Colors.red;

  List<String> _colorList = ['Red', 'Blue', 'Green'];

  String get color => _color;
  Color get btnColor => _btnColor;

  void changeColor(val) {
    if (_colorList.contains(val)) {
      _color = val;
      switch (val) {
        case 'Blue':
          _btnColor = Colors.blue;
          break;
        case 'Green':
          _btnColor = Colors.lightGreen;
          break;
        default:
          _btnColor = Colors.red;
      }

      /// 通知页面刷新
      notifyListeners();
    }
  }
}
