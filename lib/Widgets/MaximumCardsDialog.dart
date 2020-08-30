import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaximumCardsDialog extends StatefulWidget {
  final String CollectionName;
  final ID;

  const MaximumCardsDialog({this.CollectionName, this.ID});

  @override
  _MaximumCardsDialogState createState() => _MaximumCardsDialogState();
}

class _MaximumCardsDialogState extends State<MaximumCardsDialog> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Maximum Card Limit Reached",
      ),
      content: new Text("Sorry, You only add upto 18 cards in this Step."),
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
