import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("test title"),
          trailing: Icon(Icons.chevron_right),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey[500],
        );
      },
      itemCount: 5,
    ));
  }
}
