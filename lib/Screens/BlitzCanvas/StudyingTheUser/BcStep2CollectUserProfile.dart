import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

//String userProfile = '';

var userProfileLabelColor = Color(0XFF919191);
bool validUserProfile = true;
final userProfileTextController = TextEditingController();
final userProfileFocusNode = new FocusNode();
String userProfileText;

class BcStep2CollectUserProfile extends StatefulWidget {
  @override
  _BcStep2CollectUserProfileState createState() =>
      _BcStep2CollectUserProfileState();
}

class _BcStep2CollectUserProfileState extends State<BcStep2CollectUserProfile> {
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
          margin: EdgeInsets.only(top: 8.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Let's collect some details on User's Profile",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        //textAlign: TextAlign.center,
                      )),
                  TextFieldWidget(
                    labelText:
                        'Please provide a link to the User\'s (updated) Persona',
                    myTextController: userProfileTextController,
                    myFocusNode: userProfileFocusNode,
                    validText: validUserProfile,
                    maxLines: 1,
                    textCollecter: userProfileText,
                    helperText: '',
                    labelcolour: userProfileLabelColor,
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
                            bcStepsContent[1].bcCompletionValidator = false;
                            Navigator.pushNamed(
                                context, '/BCStep2CaptureUserStories');
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
