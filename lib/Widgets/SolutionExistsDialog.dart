import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolutionExistsDialogue extends StatefulWidget {
  @override
  _SolutionExistsDialogueState createState() => _SolutionExistsDialogueState();
}

class _SolutionExistsDialogueState extends State<SolutionExistsDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Solution Already Exists!",
      ),
      content: new Text("Try changing the name of you solution"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog

        FlatButton(
          child: new Text(
            "OK",
            style: TextStyle(
                color: Color(
              0XFFE95420,
            )),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
