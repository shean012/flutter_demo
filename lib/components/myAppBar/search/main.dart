import 'package:flutter/material.dart';

class AppbarSearch extends StatefulWidget {
  AppbarSearch({Key key}) : super(key: key);

  @override
  _AppbarSearchState createState() => _AppbarSearchState();
}

class _AppbarSearchState extends State<AppbarSearch> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity, minHeight: 35.0),
        child: Container(
          height: 35,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
                child: TextField(
                  enabled: false,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'search for products'),
                ),
                onTap: () => print('do some thing')),
          ),
        ));
  }
}
