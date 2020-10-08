import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/ManagingGrowth/addparallelinnovations.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class parallelDialogue extends StatefulWidget {
  final String solutionName;
  final String solutionDescription;
  final bool inConceptDashboard;

  const parallelDialogue(
      {this.solutionName, this.solutionDescription, this.inConceptDashboard});

  @override
  _parallelDialogueState createState() => _parallelDialogueState();
}

class _parallelDialogueState extends State<parallelDialogue> {
  final _firestore = Firestore.instance;
  var SolutionNamelabelColor = Color(0XFF919191);
  bool validSolutionName = true;
  var SolutionNameTextController = TextEditingController();
  final SolutiontNameFocusNode = new FocusNode();
  String SolutionName;

  var SolutionDescriptionLabelColor = Color(0XFF919191);
  bool validSolutionDescription = true;
  var SolutionDescriptionTextController = TextEditingController();
  final SolutionDescriptionFocusNode = new FocusNode();
  String SolutionDescription;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  validator() {
    setState(() {
      SolutionNameTextController.text.isEmpty
          ? validSolutionName = false
          : validSolutionName = true;
      SolutionNameTextController.text.isEmpty
          ? SolutionNamelabelColor = Color(0xFFF53E70)
          : SolutionNamelabelColor = Color(0xFF919191);

      SolutionDescriptionTextController.text.isEmpty
          ? validSolutionDescription = false
          : validSolutionDescription = true;
      SolutionDescriptionTextController.text.isEmpty
          ? SolutionDescriptionLabelColor = Color(0xFFF53E70)
          : SolutionDescriptionLabelColor = Color(0xFF919191);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      SolutionName = widget.solutionName;
      SolutionDescription = widget.solutionDescription;

      SolutionDescriptionTextController =
          TextEditingController(text: widget.solutionDescription);
      SolutionNameTextController =
          TextEditingController(text: widget.solutionName);
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Parallel Products",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: SolutiontNameFocusNode,

                    onTap: () {
                      requestFocus(SolutiontNameFocusNode);
                    },
                    controller: SolutionNameTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Add solution name',
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
                          color: SolutiontNameFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : SolutionNamelabelColor),
                      errorText:
                          validSolutionName ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (SolutionNameTextController.text == "") {
                        setState(() {
                          SolutionName = SolutionNameTextController.text;
                          validSolutionName = false;
                          SolutionNamelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SolutionName = SolutionNameTextController.text;
                          validSolutionName = true;
                          SolutionNamelabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (SolutionNameTextController.text == "") {
                        setState(() {
                          SolutionName = SolutionNameTextController.text;
                          validSolutionName = false;
                          SolutionNamelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SolutionName = SolutionNameTextController.text;
                          validSolutionName = true;
                          SolutionNamelabelColor = Colors.grey;
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
                    focusNode: SolutionDescriptionFocusNode,

                    onTap: () {
                      requestFocus(SolutionDescriptionFocusNode);
                    },
                    controller: SolutionDescriptionTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Add solution description',
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
                          color: SolutionDescriptionFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : SolutionDescriptionLabelColor),
                      errorText: validSolutionDescription
                          ? null
                          : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (SolutionDescriptionTextController.text == "") {
                        setState(() {
                          SolutionDescription =
                              SolutionDescriptionTextController.text;
                          validSolutionDescription = false;
                          SolutionDescriptionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SolutionDescription =
                              SolutionDescriptionTextController.text;
                          validSolutionDescription = true;
                          SolutionDescriptionLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (SolutionDescriptionTextController.text == "") {
                        setState(() {
                          SolutionDescription =
                              SolutionDescriptionTextController.text;
                          validSolutionDescription = false;
                          SolutionDescriptionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          SolutionDescription =
                              SolutionDescriptionTextController.text;
                          validSolutionDescription = true;
                          SolutionDescriptionLabelColor = Colors.grey;
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
                    child: DashboardCards(
                      editableCard: false,
                      cardIcon: Icons.next_week,
                      cardTitle: 'Parallel Products',
                      cardNote:
                          'At present, we can think of this additional product concept which can one of the we can think of these parallel innovations which can be of value to our customer base: \n $SolutionName - $SolutionDescription',
                      onTap: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                        onTap: (SolutionNameTextController.text == '' ||
                                SolutionDescriptionTextController.text == '')
                            ? () {
                                validator();
                              }
                            : () {
                                (SolutionNameTextController.text != '' &&
                                        SolutionDescriptionTextController
                                                .text !=
                                            '')
                                    ? (widget.inConceptDashboard)
                                        ? Navigator.popAndPushNamed(
                                            context, '/conceptDashboard')
                                        : Navigator.popAndPushNamed(
                                            context, '/BUFDashboard')
//                                    Navigator.pop(context)
                                    : {};
                                _firestore
                                    .collection(
                                        '$currentUser/ManagingGrowth/parallelInnovations')
                                    .document(
                                        AddingNewParallelInnovations[0].ID)
                                    .updateData({
                                  'Name': SolutionNameTextController.text,
                                  'Description':
                                      SolutionDescriptionTextController.text,
                                });
                              },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(
                        OnTap: () {
                          Navigator.pop(context);
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
