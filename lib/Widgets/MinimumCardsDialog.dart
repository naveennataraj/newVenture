import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinimumCardsDialog extends StatefulWidget {
  final String CollectionName;
  final ID;

  const MinimumCardsDialog({this.CollectionName, this.ID});

  @override
  _MinimumCardsDialogState createState() => _MinimumCardsDialogState();
}

class _MinimumCardsDialogState extends State<MinimumCardsDialog> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Minimum Card Limit",
      ),
      content: new Text("Sorry, You have to add atleast 1 card in this Step."),
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
