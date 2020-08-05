import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteDialogue extends StatefulWidget {
  final String CollectionName;
  final ID;

  const DeleteDialogue({this.CollectionName, this.ID});

  @override
  _DeleteDialogueState createState() => _DeleteDialogueState();
}

class _DeleteDialogueState extends State<DeleteDialogue> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Delete card?",
      ),
      content: new Text("This will remove the card permanently"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text(
            "Delete",
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            setState(() {
              print('i should delete know');
//                  erased = true;
//                  widget.removingat.removeAt(widget.index);
              _firestore
                  .collection(widget.CollectionName)
                  .document(widget.ID)
                  .delete();
            });
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: new Text(
            "Head Back",
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
