import 'package:flutter/material.dart';
import './search/main.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.black,
                            icon: Icon(
                              Icons.menu,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                        IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.perm_identity),
                            onPressed: null)
                      ],
                    ),
                  ),
                  Flexible(
                      child: Center(
                    child: Image.network(
                        'https://img1.homary.com/common/2021/05/27/616326058adee71aa21eda37a13fb2ac.png',
                        width: 100),
                  )),
                  Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.favorite_border),
                            onPressed: null),
                        IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.shopping_cart_outlined),
                            onPressed: null)
                      ],
                    ),
                  )
                ],
              ),
              AppbarSearch()
            ],
          )),
    );
  }
}
