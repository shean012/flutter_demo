import 'package:flutter/material.dart';
import './bannerBottomBar/main.dart';
import '../../components/titleBar/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/main.dart';

// 首页页面
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // banner
          Container(
            width: double.infinity,
            height: 200.h,
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 20, right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201808%2F20%2F20180820090848_kwbao.thumb.700_0.jpg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626147610&t=4fdc7257944716f93bec0ebad917fc9f'),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey[200],
                )),
          ),
          // banner Tips bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BannerBottomBarItem(
                  title: 'Get \$300 Off',
                  icon: Icons.car_rental,
                  margin: EdgeInsets.only(left: 20)),
              BannerBottomBarItem(
                  title: 'Free Shipping', icon: Icons.car_rental),
              BannerBottomBarItem(
                  title: '30-Day Return',
                  icon: Icons.calendar_today_outlined,
                  margin: EdgeInsets.only(right: 20)),
            ],
          ),
          TitleBar(title: 'Living Room Module', targetUrl: ''),
          // listView product classify
          Container(
            margin: EdgeInsets.only(top: 10.h),
            height: 120.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 150.w,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: 150.w,
                      height: 120.h,
                      padding: EdgeInsets.only(top: 5.h, left: 15.w),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/baseImage.png',
                                image:
                                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fsinakd2020712s%2F214%2Fw640h374%2F20200712%2F11e8-iwhseit4872779.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626158538&t=afadce8eabbfcfa504f61fff436c3337'),
                          ),
                          SizedBox(height: 10.h),
                          Text('BASIN TAP4L')
                        ],
                      ));
                },
                itemCount: 8),
          ),
          Consumer<SelectColor>(builder: (context, SelectColor value, child) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 5.h),
              child: Text(value.color,
                  style: TextStyle(
                      color: value.btnColor,
                      fontFamily: 'Lazer84',
                      fontSize: 30.sp)),
            );
          }),
        ],
      ),
    );
  }
}
