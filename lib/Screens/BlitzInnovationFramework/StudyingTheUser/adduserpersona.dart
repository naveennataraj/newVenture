import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddUserPersona extends StatefulWidget {
  @override
  _AddUserPersonaState createState() => _AddUserPersonaState();
}

class _AddUserPersonaState extends State<AddUserPersona> {
  bool validUserPersona = true;
  var UserPersonalabelColor = Color(0XFF919191);
  var UserPersonaTextController = TextEditingController();
  final UserPersonaFocusNode = new FocusNode();
  String UserPersona;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height * .40,
          margin: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width * .40,
          decoration: BoxDecoration(
            color: Colors.white,
            //shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Add details of the foundational aspects of the business',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  TextFieldWidget(
                    labelText: "Please provide a link to the User's Persona",
                    maxLines: 1,
                    validText: validUserPersona,
                    myFocusNode: UserPersonaFocusNode,
                    myTextController: UserPersonaTextController,
                    textCollecter: UserPersona,
                    helperText: '',
                    labelcolour: UserPersonalabelColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        goNextButton(
                          OnTap: () {
                            bcpData[1].CompletionValidator = false;
                            print(bcpData[1].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/adduserenvironmentdetails');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
