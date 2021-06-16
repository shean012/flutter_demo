import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerBottomBarItem extends StatelessWidget {
  final title;
  final IconData icon;
  final EdgeInsets margin;
  const BannerBottomBarItem(
      {Key key, @required this.title, @required this.icon, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('home page run build');
    return Container(
      margin: this.margin,
      child: Row(
        children: [
          Icon(this.icon, size: 14),
          SizedBox(width: 5.w),
          Text(this.title)
        ],
      ),
    );
  }
}
