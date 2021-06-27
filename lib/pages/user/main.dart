import 'package:flutter_demo/common/utils/main.dart';
import 'package:flutter_demo/webView/product.dart';

// 列表页页面
class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: ProductWebview());
  }
}
