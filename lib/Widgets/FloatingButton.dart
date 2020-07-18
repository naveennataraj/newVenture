import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 60.0, bottom: 10.0),
      child: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
      print("pressed it");
      },
      ),
    );
  }
}
