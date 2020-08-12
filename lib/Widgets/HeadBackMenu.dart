import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzCanvas/menuScreen.dart';

class headBackButtton extends StatefulWidget {
  const headBackButtton({
    Key key,
  }) : super(key: key);

  @override
  _headBackButttonState createState() => _headBackButttonState();
}

class _headBackButttonState extends State<headBackButtton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(context, new MaterialPageRoute(builder: (context) => BCScreen()),)
            .then((value) => setState(() {}),);

//        setState(() {
//          Navigator.pop(context);
//
//        });
      },
      child: Text(
        'HEAD BACK',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
