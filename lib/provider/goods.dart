import 'package:flutter/material.dart';

class GoodsList with ChangeNotifier {
  List<Goods> _goodsList =
      List.generate(10, (index) => Goods(false, 'Goods No. $index'));

  get goodsList => _goodsList;
  get total => _goodsList.length;

  collect(int index) {
    var good = _goodsList[index];
    _goodsList[index] = Goods(!good.isCollection, good.goodsName);
    notifyListeners();
  }

  addNewGoods() {
    _goodsList.add(Goods(false, 'Goods No. ${_goodsList.length + 1}'));
    notifyListeners();
  }
}

class Goods {
  bool isCollection;
  String goodsName;
  Goods(this.isCollection, this.goodsName);
}
