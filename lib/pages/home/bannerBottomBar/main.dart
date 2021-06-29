import 'package:flutter_demo/common/utils/main.dart';

class BannerBottomBarItem extends StatelessWidget {
  final title;
  final IconData icon;
  final EdgeInsets margin;
  const BannerBottomBarItem(
      {Key key, @required this.title, @required this.icon, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: Row(
        children: [
          Icon(this.icon, size: 14.sp),
          SizedBox(width: 5.w),
          Text(this.title, style: TextStyle(fontSize: 13.sp))
        ],
      ),
    );
  }
}
