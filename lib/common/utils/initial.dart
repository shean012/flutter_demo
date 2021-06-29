import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/request/request.dart';
import 'package:flutter_demo/common/utils/localstorage.dart';

/// 全局变量
class Global {
  /// 判断当前环境是否 release (生产环境)
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    
    WidgetsFlutterBinding.ensureInitialized();

    // 初始化工具函数
    Request();
    await Localstorage.init();

    /// android 初始化
    if (Platform.isAndroid) {}

    /// IOS 初始化
    if (Platform.isIOS) {}
  }
}
