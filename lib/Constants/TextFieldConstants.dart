import 'package:flutter/material.dart';

const TextFieldsDecoration = InputDecoration(
  labelText: 'Label Text goes Here',
  errorStyle: TextStyle(
    color: Color(0xFFF53E70),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      width: 1.5,
      color: Color(0xFFE95420),
    ),
  ),
);

String currentUser = 'Tester1@gmail.com';
