import 'package:firebase_auth/firebase_auth.dart';
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
final _auth = FirebaseAuth.instance;
//String currentUser = '';
String currentUser = 'tester@gmail.com';

FirebaseUser loggedInUser;
void getCurrentUser() async {
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      currentUser = user.email;
      print(currentUser);
    } else {
      print('No user');
    }
  } catch (e) {
    print(e);
  }
}

const topHeadingTextStyle = TextStyle(
  fontSize: 55,
  fontFamily: 'Ubuntu',
  //fontWeight: FontWeight.bold
);
const sideHeadingTextStyle = TextStyle(
  fontSize: 35,
  fontFamily: 'Ubuntu',
  //fontWeight: FontWeight.bold
);
const cardTitleTextStyle =
    TextStyle(fontSize: 20, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold);
const responsiveMediumCardTitleTextStyle = TextStyle(
    fontSize: 18.5, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold);

const cardBodyTextStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'OpenSans',
  //fontWeight: FontWeight.bold
);
const responsiveSmallCardBodyTextStyle = TextStyle(
  fontSize: 17,
  fontFamily: 'OpenSans',
  //fontWeight: FontWeight.bold
);

const emptyStateTextStyle = TextStyle(
  fontSize: 15,
  fontFamily: 'OpenSans',
  color: Colors.grey,
  //fontWeight: FontWeight.bold
);

const menuIntroTextStyle =
    TextStyle(fontSize: 17, fontFamily: 'OpenSans', color: Color(0xFF666666)
        //fontWeight: FontWeight.bold
        );

const menuIntroBoldTextStyle = TextStyle(
  fontSize: 17,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

const listTileSmall =
    TextStyle(fontSize: 12, fontFamily: 'OpenSans', color: Color(0xFF666666)
        //fontWeight: FontWeight.bold
        );
