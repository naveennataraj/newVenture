import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class ReviewFitDialog extends StatefulWidget {
  final bool firebaseStep0;
  final bool firebaseStep1;
  final bool firebaseStep2;
  final bool firebaseStep3;
  final bool firebaseStep4;
  final bool firebaseStep5;

  const ReviewFitDialog(
      {this.firebaseStep0,
      this.firebaseStep1,
      this.firebaseStep2,
      this.firebaseStep3,
      this.firebaseStep4,
      this.firebaseStep5});

  @override
  _ReviewFitDialogState createState() => _ReviewFitDialogState();
}

class _ReviewFitDialogState extends State<ReviewFitDialog> {
  final _firestore = Firestore.instance;
  @override
  void initState() {
    if (widget.firebaseStep0 == false ||
        widget.firebaseStep1 == false ||
        widget.firebaseStep2 == false ||
        widget.firebaseStep3 == false ||
        widget.firebaseStep4 == false ||
        widget.firebaseStep5 == false) {
      Navigator.pop(context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        "Your Solution Review Fit Date has lapsed",
      ),
      content: new Text("Would you like to review your Solution?"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        FlatButton(
          child: new Text(
            "May be later",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: 20,
        ),
        FlatButton(
          child: new Text(
            "Yes, I would like to revist My Solution",
            style: TextStyle(
                color: Color(
              0XFFE95420,
            )),
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/BlitzInnovationFramework');
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({
              'bcStepsContent0': false,
              'bcStepsContent1': false,
              'bcStepsContent2': false,
              'bcStepsContent3': false,
              'bcStepsContent4': false,
              'bcStepsContent5': false,
            });
          },
        ),
      ],
    );
  }
}
