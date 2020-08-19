import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class headBackButtton extends StatefulWidget {
  final String routeName;
  final Function widget;
  const headBackButtton({@required this.routeName, this.widget});
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
        if (widget.routeName != null) {
          Navigator.popAndPushNamed(context, routeName).then(
                (value) => setState(() {}),
          );
          if (widget.widget !=null) {
            widget.widget();
          }
        }

      },
      child: Text(
        'HEAD BACK',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
