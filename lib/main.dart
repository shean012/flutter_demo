import 'dart:async';
import 'package:flutter_demo/common/utils/entrance.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo/router/routes.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:flutter_demo/common/utils/main.dart';
import 'package:flutter_demo/pages/index/main.dart';

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
          ChangeNotifierProvider.value(value: GoodsList()),
          ChangeNotifierProvider.value(value: Lang())
        ],
        child: Consumer<Lang>(builder: (context, Lang value, child) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate
            ],
            locale: value.curLocale,
            supportedLocales: [
              const Locale('zh', 'CN'),
              const Locale('en', 'US'),
            ],
            theme: ThemeData(
                primarySwatch: Colors.orange,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent),
            // 配置路由
            onGenerateRoute: Routes.router.generator,
            navigatorKey: navigatorKey,
            home: MainPage(),
            // routes: staticRouters,
          );
        }));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _sub = await initUniLinks(context);
  }

  @override
  void dispose() {
    super.dispose();
    if (_sub != null) _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667), builder: () => IndexPage());
  }
}
