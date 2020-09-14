import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinimumCardsDialog extends StatefulWidget {
  final int minimumcards;

  const MinimumCardsDialog({@required this.minimumcards});

  @override
  _MinimumCardsDialogState createState() =>
      _MinimumCardsDialogState(minimumcards);
}

class _MinimumCardsDialogState extends State<MinimumCardsDialog> {
  final int minimumcards;
  final _firestore = Firestore.instance;

  _MinimumCardsDialogState(this.minimumcards);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Minimum Card Limit",
      ),
      content: new Text(
          "Sorry, You have to add atleast $minimumcards card in this Step."),
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
