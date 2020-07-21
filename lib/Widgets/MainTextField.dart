import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class MainTextFields extends StatefulWidget {
  final String labelText;
  final bool validText;
  final FocusNode myFocusNode;
  final TextEditingController myTextController;
  final int maxLines;
  final String textCollecter;

  const MainTextFields(
      {this.labelText,
      this.validText,
      this.myFocusNode,
      this.myTextController,
      this.maxLines,
      this.textCollecter});

  @override
  _MainTextFieldsState createState() => _MainTextFieldsState(labelText,
      validText, myFocusNode, myTextController, maxLines, textCollecter);
}

class _MainTextFieldsState extends State<MainTextFields> {
  String labelText;
  bool validText;
  FocusNode myFocusNode;
  TextEditingController myTextController;
  int maxLines;
  String textCollecter;

  _MainTextFieldsState(this.labelText, this.validText, this.myFocusNode,
      this.myTextController, this.maxLines, this.textCollecter);

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        focusNode: myFocusNode,
        onTap: () {
          requestFocus(myFocusNode);
        },
        controller: myTextController,
        maxLines: maxLines,
        decoration: StepPageTextFields.copyWith(
          labelText: labelText,
          labelStyle:
              TextStyle(color: myFocusNode.hasFocus ? Color(0XFFE95420) : null),
          errorText: validText ? null : 'This field is required',
        ),
        onChanged: (text) {
          if (text == "") {
            setState(() {
              validText = false;
            });
          } else {
            setState(() {
              validText = true;
            });
          }
        },
        onSubmitted: (text) {
          if (text == "") {
            setState(() {
              validText = false;
            });
          } else {
            setState(() {
              validText = true;
            });
          }
        },
      ),
    );
  }
}
