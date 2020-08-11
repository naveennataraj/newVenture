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

//String currentUser = 'Tester1@gmail.com';
String currentUser = 'tester@gmail.com';

const topHeadingTextStyle = TextStyle(
  fontSize: 55,
  fontFamily: 'Ubuntu',
  //fontWeight: FontWeight.bold
);

const cardTitleTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold
);

const cardBodyTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'OpenSans',

    //fontWeight: FontWeight.bold
);