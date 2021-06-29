import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo/pages/signIn/main.dart';
import 'package:flutter_demo/pages/favorite/main.dart';
import 'package:flutter_demo/pages/car/main.dart';

// 登录
Handler signInPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SignInPage();
  },
);

// car 页面
Handler carPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CarPage();
});

// 路由传参 favorite 页面
Handler favoritePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  dynamic jsonParams;
  String id = params['id'].first;
  String name = params['name'].first;
  dynamic jsonData = params['paramsJson'];
  if (jsonData != null) jsonParams = jsonData.first;
  return FavoritePage(id, name: name, paramsJson: jsonParams);
});
