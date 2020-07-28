import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addEvangelistsAndEarlyAdoptersDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddDistributionMedium extends StatefulWidget {
  @override
  _AddDistributionMediumState createState() => _AddDistributionMediumState();
}

var MediumlabelColor = Color(0XFF919191);
bool validMedium = true;
var MediumTextController = TextEditingController();
final PersonMedium = new FocusNode();
String Medium;

class _AddDistributionMediumState extends State<AddDistributionMedium> {
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
                      "What medium will we be using to share the product concept?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText:
                        "What medium would you choose to share the wireframes with users?",
                    maxLines: 1,
                    validText: validPersonName,
                    myFocusNode: PersonNameFocusNode,
                    myTextController: PersonNameTextController,
                    textCollecter: PersonName,
                    helperText:
                        ' *An appropriate medium, if selected will help the early adopters and other users with quicker access to the solution concept\nand subsequently provide feedback more quickly',
                    labelcolour: PersonNamelabelColor,
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
                        CompleteStepButton(
                          OnTap: () {
                            bcpData[4].CompletionValidator = true;
                            print(bcpData[4].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/BlitzInnovationFramework');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(100),
        child: FloatingActionButton(
          tooltip: "Add's New Card",
          backgroundColor: Color(0XFFE95420),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  addEvangelistsAndEarlyAdoptersDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
