import 'package:flutter/material.dart';

const dialogueTextFieldsdecoration = InputDecoration(
  labelText: 'Label Text goes Here',
  errorStyle: TextStyle(
    color: Color(0XFFF53E70),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      width: 1.5,
      color: Color(0XFFE95420),
    ),
  ),
);

const StepPageTextFields = InputDecoration(
  labelText: 'Provide a title for your project',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      width: 1.5,
      color: Color(0XFFE95420),
    ),
  ),
);
