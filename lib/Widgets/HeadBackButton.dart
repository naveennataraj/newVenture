import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class headBackButtton extends StatelessWidget {

  const headBackButtton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        'HEAD BACK',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
