import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class TextFieldWidget extends StatefulWidget {
  String textCollecter;

  TextFieldWidget({
    this.textCollecter,
    this.validText,
    this.myTextController,
    this.labelText,
    this.myFocusNode,
    this.maxLines,
    this.labelcolour,
    this.helperText,
  });

  bool validText;
  final TextEditingController myTextController;
  final String labelText;
  FocusNode myFocusNode;
  final int maxLines;
  Color labelcolour;
  final String helperText;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        focusNode: widget.myFocusNode,
        onTap: () {
          requestFocus(widget.myFocusNode);
        },
        controller: widget.myTextController,
        maxLines: widget.maxLines,
        decoration: TextFieldsDecoration.copyWith(
          labelText: widget.labelText,
          helperText: widget.myFocusNode.hasFocus ? widget.helperText : null,
          labelStyle: TextStyle(
              color: widget.myFocusNode.hasFocus
                  ? Color(0XFFE95420)
                  : widget.labelcolour),
          errorText: widget.validText ? null : 'This field is required',
        ),
        onChanged: (text) {
          if (widget.myTextController.text == "") {
            setState(() {
              widget.textCollecter = widget.myTextController.text;
              widget.validText = false;
              widget.labelcolour = Color(0XFFF53E70);
            });
          } else {
            setState(() {
              widget.textCollecter = widget.myTextController.text;
              widget.validText = true;
              widget.labelcolour = Colors.grey;
            });
          }
        },
        onSubmitted: (text) {
          if (widget.myTextController.text == "") {
            setState(() {
              widget.textCollecter = widget.myTextController.text;
              widget.validText = false;
              widget.labelcolour = Color(0XFFF53E70);
            });
          } else {
            setState(() {
              widget.textCollecter = widget.myTextController.text;
              widget.validText = true;
              widget.labelcolour = Colors.grey;
            });
          }
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
