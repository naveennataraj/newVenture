import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/addRanking.dart';

final _firestore = Firestore.instance;

class confirmPreferenceButton extends StatefulWidget {
  confirmPreferenceButton({
    @required this.DialogueName,
    @required this.FirstPreference,
    @required this.SecondPreference,
    @required this.ThirdPreference,
  });

  final Widget DialogueName;
  final String FirstPreference;
  final String SecondPreference;
  final String ThirdPreference;

  @override
  _confirmPreferenceButtonState createState() =>
      _confirmPreferenceButtonState();
}

class _confirmPreferenceButtonState extends State<confirmPreferenceButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.FirstPreference == '')
          ? () {
              validator();
            }
          : () {
              if (AddingNewRankingArray.length != 0) {
                update();
              } else {
                add();
              }
              showDialog(
                context: context,
                builder: (BuildContext context) => widget.DialogueName,
              ).then((_) => setState(() {}));
            },
      child: Text(
        'CONFIRM PREFERENCE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }

  validator() {}

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/SolutionIdeation/rankSolutions')
        .document(AddingNewRankingArray[0].ID)
        .updateData({
      'First': widget.FirstPreference,
      'Second': widget.SecondPreference,
      'Third': widget.ThirdPreference,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/SolutionIdeation/rankSolutions').add({
      'First': widget.FirstPreference,
      'Second': widget.SecondPreference,
      'Third': widget.ThirdPreference,
      'Sender': currentUser,
    });
  }
}
