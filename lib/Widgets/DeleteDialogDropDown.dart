import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/addRanking.dart';

class DeleteDialogDropDown extends StatefulWidget {
  final String CollectionName;
  final ID;
  final String description;

  const DeleteDialogDropDown({this.CollectionName, this.ID, this.description});

  @override
  _DeleteDialogDropDownState createState() => _DeleteDialogDropDownState();
}

class _DeleteDialogDropDownState extends State<DeleteDialogDropDown> {
  final _firestore = Firestore.instance;

  void getDocument() async {
    final document = await _firestore
        .collection('$currentUser/SolutionIdeation/rankSolutions')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      AddingNewRankingArray = [];
      String FirstPreference = message.data['First'];
      String SecondPreference = message.data['Second'];
      String ThirdPreference = message.data['Third'];
      var ID = message.documentID;
      final fields = addRanking(
          ID: ID,
          FirstPreference: FirstPreference,
          SecondPreference: SecondPreference,
          ThirdPreference: ThirdPreference);

      AddingNewRankingArray.add(fields);
    }
  }

  @override
  void initState() {
    getDocument();
    super.initState();
  }

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
              print('i should delete the drop down now ');
              if (widget.description ==
                  AddingNewRankingArray[0].FirstPreference) {
                print("Update method called");
                _firestore
                    .collection('$currentUser/SolutionIdeation/rankSolutions')
                    .document(AddingNewRankingArray[0].ID)
                    .updateData({
                  'First': null,
                });
              }
              if (widget.description ==
                  AddingNewRankingArray[0].SecondPreference) {
                print("Update method called");
                _firestore
                    .collection('$currentUser/SolutionIdeation/rankSolutions')
                    .document(AddingNewRankingArray[0].ID)
                    .updateData({
                  'Second': null,
                });
              }
              if (widget.description ==
                  AddingNewRankingArray[0].ThirdPreference) {
                print("Update method called");
                _firestore
                    .collection('$currentUser/SolutionIdeation/rankSolutions')
                    .document(AddingNewRankingArray[0].ID)
                    .updateData({
                  'Third': null,
                });
              }
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
