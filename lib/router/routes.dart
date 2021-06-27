import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/router/handler.dart';
import 'package:flutter_demo/main.dart';

/// 路由
class Routes {
  static FluroRouter router;

  /// 注册页
  static String signIn = '/signIn';

  /// 收藏页
  static String favorite = '/favorite/:id';

  /// 购物车
  static String car = '/car';

  // 配置route
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('page not found!');
      return;
    });

    router.define(signIn, handler: signInPageHandler); // 注册登录页
    router.define(favorite, handler: favoritePageHandler); // 收藏页
    router.define(car, handler: carPageHandler); // 购物车页
  }

  static String formatQueryParams(Map<String, dynamic> params) {
    int idx = 0;
    String queryStr = '';
    for (var key in params.keys) {
      var value = Uri.encodeComponent(params[key]);
      if (idx == 0) {
        queryStr = "?";
      } else {
        queryStr += "\&";
      }
      queryStr += "$key=$value";
      idx++;
    }
    return queryStr;
  }

  /// 跳转 方法
  /// path: 路由地址
  /// params: 参数
  /// transition: 转场动画
  /// replace: 代换
  static Future push(BuildContext context, String path,
      {Map<String, dynamic> params,
      TransitionType transition = TransitionType.cupertino,
      bool replace = false,
      bool clearStack = false}) {
    String queryStr = "";
    // 拼接 query 参数
    if (params != null) {
      queryStr = formatQueryParams(params);
    }
    path = path + queryStr;
    return router.navigateTo(context, path,
        transition: transition, replace: replace, clearStack: clearStack);
  }


  

  /// 返回方法
  static pop() {
    // 全局 context
    BuildContext context = navigatorKey.currentState.overlay.context;
    router.pop(context);
  }

  /// 进入首页
  static goHome(BuildContext context, {bool replace = false}) {
    router.navigateTo(context, "/home",
        replace: replace, transition: TransitionType.fadeIn);
  }
}
