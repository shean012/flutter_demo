import 'package:flutter_demo/components/goBackAppBar/main.dart';
import 'package:flutter_demo/common/utils/main.dart';
import 'package:flutter_demo/generated/l10n.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targetColor = Provider.of<SelectColor>(context);
    final curLangCtrl = Provider.of<Lang>(context);
    print('run car page bulid');
    return Scaffold(
        appBar: GoBackAppBar(),
        body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              children: [
                Text(targetColor.color,
                    style: TextStyle(
                        color: targetColor.btnColor,
                        fontFamily: 'Lazer84',
                        fontSize: 30.sp)),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Consumer<SelectColor>(
                            builder: (context, SelectColor value, child) {
                          return RawMaterialButton(
                            onPressed: () {
                              value.changeColor('Red');
                            },
                            fillColor: Colors.red,
                            child: Text('Red',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp)),
                          );
                        })),
                    Flexible(
                        flex: 1,
                        child: Consumer<SelectColor>(
                            builder: (context, SelectColor value, child) {
                          return RawMaterialButton(
                            onPressed: () {
                              value.changeColor('Blue');
                            },
                            fillColor: Colors.blue,
                            child: Text('blue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp)),
                          );
                        })),
                    Flexible(
                        flex: 1,
                        child: Consumer<SelectColor>(
                            builder: (context, SelectColor value, child) {
                          return RawMaterialButton(
                            onPressed: () {
                              value.changeColor('Green');
                            },
                            fillColor: Colors.green,
                            child: Text('green',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp)),
                          );
                        }))
                  ],
                ),
                Wrap(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('${S.of(context).button}')),
                    TextButton(
                        onPressed: () {},
                        child: Text('${S.of(context).title}')),
                    TextButton(
                        onPressed: () {},
                        child: Text('${S.of(context).drawer_tip}')),
                    TextButton(
                        onPressed: () {
                          curLangCtrl.changeCurLang();
                        },
                        child: Text('切换语言'))
                  ],
                )
              ],
            )));
  }
}
