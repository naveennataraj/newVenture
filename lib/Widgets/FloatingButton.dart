import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({@required this.onPressed});
  //final String routeName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 250.0, bottom: 10.0),
      child: FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color(0XFFE95420),
      onPressed: onPressed
      ),
    );
  }
}
