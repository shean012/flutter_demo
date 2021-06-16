import 'package:flutter_demo/api/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/router/routes.dart';
import 'package:flutter_demo/common/style/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatefulWidget {
  final String id;
  final String name;

  FavoritePage(this.id, {Key key, this.name}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  _getdata() async {
    var res = await ProductApi.getProduct();
    print('res ---- get product $res');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColor.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Favorite page',
              style: TextStyle(
                  fontFamily: 'Lazer84',
                  fontSize: 30.sp,
                  color: Colors.red[500])),
          SizedBox(width: double.infinity, height: 10.h),
          Text('page - id: ${widget.id}'),
          Text('page params -- name: ${widget.name}'),
          TextButton(
              onPressed: () {
                this._getdata();
              },
              child: Container(
                child: Text('get data',
                    style: TextStyle(fontSize: 15.sp, color: Colors.white)),
              )),
          TextButton(
              onPressed: () => Routes.pop(),
              child: Container(
                child: Text('go back',
                    style: TextStyle(fontSize: 15.sp, color: Colors.white)),
              ))
        ],
      ),
    ));
  }
}
