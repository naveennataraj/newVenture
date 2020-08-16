import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class headBackButtton extends StatefulWidget {
  final String routeName;
  const headBackButtton({@required this.routeName});
//  const headBackButtton({
//    Key key,
//  }) : super(key: key);
  @override
  _headBackButttonState createState() => _headBackButttonState(routeName);
}

class _headBackButttonState extends State<headBackButtton> {
  String routeName;
  _headBackButttonState(this.routeName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, routeName).then(
          (value) => setState(() {}),
        );

//        Navigator.push(context, new MaterialPageRoute(builder: (context) => BCScreen()),)
//            .then((value) => setState(() {}),);

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
