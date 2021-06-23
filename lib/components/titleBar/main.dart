import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style/main.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String targetUrl;

  const TitleBar({Key key, @required this.title, this.targetUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10.w, right: 0.w, top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(this.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
            Offstage(
              offstage: this.targetUrl != null || this.targetUrl.isEmpty
                  ? false
                  : true,
              child: GestureDetector(
                child: Row(
                  children: [Text('Views more'), Icon(Icons.chevron_right)],
                ),
                onTap: () {
                  if (this.targetUrl.isEmpty || this.targetUrl != null) {
                    print('do something');
                  }
                },
              ),
            ),
          ],
        ));
  }
}
