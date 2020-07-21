import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class DialogueTextFields extends StatefulWidget {
  final String textCollecter;
  final bool validText;
  final TextEditingController myTextController;
  final String labelText;
  final FocusNode myFocusNode;
  final int maxLines;
  final Color labelcolour;
  final String helperText;

  const DialogueTextFields(
      {this.textCollecter,
      this.validText,
      this.myTextController,
      this.labelText,
      this.labelcolour,
      this.myFocusNode,
      this.maxLines,
      this.helperText});

  @override
  _DialogueTextFieldsState createState() => _DialogueTextFieldsState(
      textCollecter,
      validText,
      myTextController,
      labelText,
      labelcolour,
      maxLines,
      myFocusNode,
      helperText);
}

class _DialogueTextFieldsState extends State<DialogueTextFields> {
  String textCollecter;
  bool validText;
  TextEditingController myTextController;
  String labelText;
  FocusNode myFocusNode;
  int maxLines;
  Color labelcolour;
  String helperText;

  _DialogueTextFieldsState(
      this.textCollecter,
      this.validText,
      this.myTextController,
      this.labelText,
      this.labelcolour,
      this.maxLines,
      this.myFocusNode,
      this.helperText);
  void requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        focusNode: myFocusNode,
        onTap: () {
          requestFocus(myFocusNode);
        },
        controller: myTextController,
        maxLines: maxLines,
//                      maxLength: maxLength,
        decoration: dialogueTextFieldsdecoration.copyWith(
          labelText: labelText,
          helperText: myFocusNode.hasFocus
              ? 'Ensure to be Brief in this box. In the following box, more details will be collected about this pain point'
              : null,
          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Color(0XFFE95420) : labelcolour),
          errorText: validText ? null : 'This field is required',
        ),
        onChanged: (text) {
          if (myTextController.text == "") {
            setState(() {
              validText = false;
              labelcolour = Color(0XFFF53E70);
            });
          } else {
            setState(() {
              validText = true;
              labelcolour = Colors.grey;
              return textCollecter = myTextController.text;
            });
          }
        },
        onSubmitted: (text) {
          if (myTextController.text == "") {
            setState(() {
              validText = false;
              labelcolour = Color(0XFFF53E70);
            });
          } else {
            setState(() {
              validText = true;
              labelcolour = Colors.grey;
              return textCollecter = myTextController.text;
            });
          }
        },
      ),
    );
  }
}
