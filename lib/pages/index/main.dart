import 'package:flutter_demo/common/utils/main.dart';
import '../../components/myDrawer/main.dart';
import '../../components//myAppBar/main.dart';
import '../../pages/home/main.dart';
import '../../pages/list/main.dart';
import '../../pages/user/main.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
    return Container(
      child: Scaffold(
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
      ),
    );
  }
}
