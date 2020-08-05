import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addEvangelistsAndEarlyAdoptersDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddDistributionMedium extends StatefulWidget {
  @override
  _AddDistributionMediumState createState() => _AddDistributionMediumState();
}

class _AddDistributionMediumState extends State<AddDistributionMedium> {
  bool spinner = false;
  final _firestore = Firestore.instance;

  var MediumlabelColor = Color(0XFF919191);
  bool validMedium = true;
  var MediumTextController = TextEditingController();
  final MediumFocus = new FocusNode();
  String Medium;

  validator() {
    setState(() {
      MediumTextController.text.isEmpty
          ? validMedium = false
          : validMedium = true;
      MediumTextController.text.isEmpty
          ? MediumlabelColor = Color(0xFFF53E70)
          : MediumlabelColor = Color(0xFF919191);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/PreValidation/addMedium')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      addMediumArray = [];
      final Medium = message.data['Medium'];
      final ID = message.documentID;

      final fields = addDistributionMedium(medium: Medium, ID: ID);

      addMediumArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (addMediumArray.length != 0) {
        MediumTextController =
            TextEditingController(text: addMediumArray[0].medium);
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/PreValidation/addMedium')
        .document(addMediumArray[0].ID)
        .updateData({
      'Medium': MediumTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/PreValidation/addMedium').add({
      'Medium': MediumTextController.text,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
    getDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Center(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "What medium will we be using to share the product concept?",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText:
                          "What medium would you choose to share the wireframes with users?",
                      maxLines: 1,
                      validText: validMedium,
                      myFocusNode: MediumFocus,
                      myTextController: MediumTextController,
                      textCollecter: Medium,
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
                            OnTap: (MediumTextController.text == '')
                                ? () {
                                    validator();
                                  }
                                : () {
                                    if (addMediumArray.length != 0) {
                                      update();
                                    } else {
                                      add();
                                    }
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
