import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class needOfUsersDialogue extends StatefulWidget {
  final String Asa;
  final String IwantTo;
  final String SothatIcan;
  final bool inConceptDashboard;

  const needOfUsersDialogue(
      {this.Asa, this.IwantTo, this.SothatIcan, this.inConceptDashboard});

  @override
  _needOfUsersDialogueState createState() => _needOfUsersDialogueState();
}

class _needOfUsersDialogueState extends State<needOfUsersDialogue> {
  UserStory(int index) {
    String A = widget.Asa;
    String B = widget.IwantTo;
    String C = widget.SothatIcan;

    return 'As a $A, I want to $B so that $C';
  }

  final _firestore = Firestore.instance;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  var AsalabelColor = Color(0XFF919191);
  bool validAsa = true;
  var AsaTextController = TextEditingController();
  final AsaFocusNode = new FocusNode();
  String Asa;

  var IWantTolabelColor = Color(0XFF919191);
  bool validIWantTo = true;
  var IWantToTextController = TextEditingController();
  final IWantToFocusNode = new FocusNode();
  String IWantTo;

  var SoThatlabelColor = Color(0XFF919191);
  bool validSoThat = true;
  var SoThatTextController = TextEditingController();
  final SoThatFocusNode = new FocusNode();
  String SoThat;

  validator() {
    setState(() {
      AsaTextController.text.isEmpty ? validAsa = false : validAsa = true;
      AsaTextController.text.isEmpty
          ? AsalabelColor = Color(0xFFF53E70)
          : AsalabelColor = Color(0xFF919191);

      IWantToTextController.text.isEmpty
          ? validIWantTo = false
          : validIWantTo = true;
      IWantToTextController.text.isEmpty
          ? IWantTolabelColor = Color(0xFFF53E70)
          : IWantTolabelColor = Color(0xFF919191);

      SoThatTextController.text.isEmpty
          ? validSoThat = false
          : validSoThat = true;
      SoThatTextController.text.isEmpty
          ? SoThatlabelColor = Color(0xFFF53E70)
          : SoThatlabelColor = Color(0xFF919191);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      Asa = widget.Asa;
      IWantTo = widget.IwantTo;
      SoThat = widget.SothatIcan;
      AsaTextController = TextEditingController(text: widget.Asa);
      IWantToTextController = TextEditingController(text: widget.IwantTo);
      SoThatTextController = TextEditingController(text: widget.SothatIcan);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
//        height: 600,
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Needs of our user(s)",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: AsaFocusNode,

                    onTap: () {
                      requestFocus(AsaFocusNode);
                    },
                    controller: AsaTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'As a',
                      helperText: 'Who is the user for this story?',
                      helperMaxLines: 3,
                      helperStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 11
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 15),
                          fontFamily: 'OpenSans'),
                      labelStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 16),
                          fontFamily: 'OpenSans',
                          color: AsaFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : AsalabelColor),
                      errorText: validAsa ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (AsaTextController.text == "") {
                        setState(() {
                          Asa = AsaTextController.text;
                          validAsa = false;
                          AsalabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Asa = AsaTextController.text;
                          validAsa = true;
                          AsalabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (AsaTextController.text == "") {
                        setState(() {
                          Asa = AsaTextController.text;
                          validAsa = false;
                          AsalabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Asa = AsaTextController.text;
                          validAsa = true;
                          AsalabelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: IWantToFocusNode,

                    onTap: () {
                      requestFocus(IWantToFocusNode);
                    },
                    controller: IWantToTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'I want',
                      helperText:
                          'What is the desired action, which the user is able to perform using the system? ',
                      helperMaxLines: 3,
                      helperStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 11
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 15),
                          fontFamily: 'OpenSans'),
                      labelStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 16),
                          fontFamily: 'OpenSans',
                          color: IWantToFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : IWantTolabelColor),
                      errorText: validIWantTo ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (IWantToTextController.text == "") {
                        setState(() {
                          IWantTo = IWantToTextController.text;
                          validIWantTo = false;
                          IWantTolabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          IWantTo = IWantToTextController.text;
                          validIWantTo = true;
                          IWantTolabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (IWantToTextController.text == "") {
                        setState(() {
                          IWantTo = IWantToTextController.text;
                          validIWantTo = false;
                          IWantTolabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          IWantTo = IWantToTextController.text;
                          validIWantTo = true;
                          IWantTolabelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: SoThatFocusNode,

                    onTap: () {
                      requestFocus(SoThatFocusNode);
                    },
                    controller: SoThatTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'So that',
                      helperText:
                          'What is the goal of the user when performing this action?',
                      helperMaxLines: 3,
                      helperStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 11
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 15),
                          fontFamily: 'OpenSans'),
                      labelStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 16),
                          fontFamily: 'OpenSans',
                          color: SoThatFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : SoThatlabelColor),
                      errorText: validSoThat ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (SoThatTextController.text == "") {
                        setState(() {
                          SoThat = SoThatTextController.text;
                          validSoThat = false;
                          SoThatlabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SoThat = SoThatTextController.text;
                          validSoThat = true;
                          SoThatlabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (SoThatTextController.text == "") {
                        setState(() {
                          SoThat = SoThatTextController.text;
                          validSoThat = false;
                          SoThatlabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SoThat = SoThatTextController.text;
                          validSoThat = true;
                          SoThatlabelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'ourCustomer',
                      child: DashboardCards(
                        cardIcon: Icons.supervisor_account,
                        cardTitle: 'Needs of our user(s)',
                        cardNote:
                            '"As a $Asa, I want to $IWantTo so that $SoThat"',
                        onTap: () {
                          Navigator.pushNamed(context, '/addstoriespainpoints');
                        },
                        editableCard: false,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                        onTap: (AsaTextController.text == '' ||
                                SoThatTextController.text == '' ||
                                IWantToTextController.text == '')
                            ? () {
                                validator();
                              }
                            : () {
                                (AsaTextController.text != '' &&
                                        SoThatTextController.text != '' &&
                                        IWantToTextController.text != '')
                                    ? (widget.inConceptDashboard)
                                        ? Navigator.popAndPushNamed(
                                            context, '/conceptDashboard')
                                        : Navigator.popAndPushNamed(
                                            context, '/BUFDashboard')
                                    : {};
                                _firestore
                                    .collection(
                                        '$currentUser/StudyingTheUser/userStory')
                                    .document(AddingNewUserStory[0].ID)
                                    .updateData({
                                  'Asa': AsaTextController.text,
                                  'IWantTo': SoThatTextController.text,
                                  'SoThat': IWantToTextController.text,
                                  'Sender': "tester@gmail.com",
                                });
                              },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(
                        OnTap: () {
                          Navigator.popAndPushNamed(
                              context, '/conceptDashboard');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
