import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './components/myDrawer/main.dart';
import './components//myAppBar/main.dart';
import './pages/home/main.dart';
import './pages/list/main.dart';
import './pages/user/main.dart';
import './router/routes.dart';
import './common/utils/initial.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/main.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Routes.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SelectColor()),
        ],
        child: ScreenUtilInit(
            designSize: Size(375, 667),
            builder: () => MaterialApp(
                  theme: ThemeData(
                      primarySwatch: Colors.orange,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent),
                  // 配置路由
                  onGenerateRoute: Routes.router.generator,
                  navigatorKey: navigatorKey,
                  home: MainPage(),
                  // routes: staticRouters,
                )));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> _pageList = [
    HomePage(),
    ListPage(),
    UserPage(),
  ];

  List<BottomNavigationBarItem> _barItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: '列表'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size.fromHeight(90.0),
      ),
      drawer: MyDrawer(),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        currentIndex: this._currentIndex,
        items: _barItem,
        fixedColor: Colors.orange,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
