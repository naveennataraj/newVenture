import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class ValidationDialogue extends StatefulWidget {
  final String contentDescription;
  const ValidationDialogue({this.contentDescription});

  @override
  _ValidationDialogueState createState() =>
      _ValidationDialogueState(contentDescription);
}

class _ValidationDialogueState extends State<ValidationDialogue> {
  String contentDescription;
  _ValidationDialogueState(this.contentDescription);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Notification",
        style: cardTitleTextStyle,
      ),
      content: Text(
        contentDescription,
        style: cardBodyTextStyle,
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog

        FlatButton(
          child: new Text(
            "CONTINUE",
            style: TextStyle(
                color: Color(
              0XFFE95420,
            )),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
