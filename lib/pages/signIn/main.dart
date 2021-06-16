import 'package:flutter/material.dart';
import 'package:flutter_demo/api/user.dart';
import 'package:flutter_demo/common/style/main.dart';
import 'package:flutter_demo/components/goBackAppBar/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/common/utils/validator.dart';
import 'package:flutter_demo/components/input_form/main.dart';
import 'package:flutter_demo/entity/main.dart';
import 'package:flutter_demo/api/main.dart';
import './tabItem/main.dart'; // TabBar 部件

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  int _currentTab = 0;
  String _email;
  String _pwd;
  bool _markState = false;

  // methods
  _userLogin() async {
    UserEmailLoginReq params = UserEmailLoginReq(email: _email, password: _pwd);
    UserEmailLoginRes res = await UserApi.emailLogin(params: params);
    print('res--- ${res.toJson()}');
  }

  _switchTab(ctx, int idx) {
    var _form = Form.of(ctx);
    _form.reset();
    this.setState(() {
      this._currentTab = idx;
    });
  }

  // widget
  Widget _head() {
    // 头部logo
    return Container(
      margin: EdgeInsets.only(top: 13.h, bottom: 20.5.h),
      child: Center(
        child: Image.asset('assets/logo.png', width: 140.w, height: 46.h),
      ),
    );
  }

  Widget _tabBar() {
    // tabBar 部件
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(bottom: 16.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(builder: (ctx) {
            return GestureDetector(
                child: TabItem('LOG IN', 0, this._currentTab),
                onTap: () => _switchTab(ctx, 0));
          }),
          Builder(builder: (ctx) {
            return GestureDetector(
                child: TabItem('SIGN UP', 1, this._currentTab),
                onTap: () => _switchTab(ctx, 1));
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        color: Colors.white,
        child: Column(
          children: [
            _head(),
            Form(
                child: Column(
              children: [
                _tabBar(),
                Input(
                  innerText: 'Email Address',
                  validator: (val) => checkEmail(val),
                  onSaved: (val) => _email = val,
                ),
                SizedBox(height: 28.h),
                Input(
                  innerText: 'password',
                  isPwd: true,
                  validator: (val) => checkPassWord(val),
                  onSaved: (val) => _pwd = val,
                ),
                SizedBox(height: 24.h),
                Offstage(
                    offstage: this._currentTab != 1,
                    child: Row(children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        margin: EdgeInsets.only(right: 10.w, left: 10.w),
                        child: Checkbox(
                            value: _markState,
                            onChanged: (val) => this.setState(() {
                                  this._markState = val;
                                })),
                      ),
                      Container(
                        width: 290.w,
                        child: Text(
                            'Follow us to receive exclusive offers and our latest news.',
                            maxLines: 3,
                            style: TextStyle(color: AppColor.primaryText)),
                      ),
                    ])),
                SizedBox(height: 12.h),
                Container(
                    width: 335.w,
                    height: 48.h,
                    child: Builder(builder: (ctx) {
                      return ElevatedButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          var _form = Form.of(ctx);
                          if (_form.validate()) {
                            _form.save();
                            _userLogin();
                          }
                        },
                        icon: Icon(Icons.lock_sharp),
                        label: Text(
                            '${this._currentTab == 0 ? "LOG IN" : "CREATE AN ACCOUNT"}',
                            style: TextStyle(fontSize: 16.sp)),
                      );
                    })),
                Offstage(
                    offstage: this._currentTab != 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 28.h),
                      child: Text(
                        'By registering, you agree to our Privacy & Cookie Policy. and Terms & Conditions. ',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
