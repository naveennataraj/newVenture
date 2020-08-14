import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/addPainPointsData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyTheProblem/painPointDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddPainPoints extends StatefulWidget {
  @override
  _AddPainPointsState createState() => _AddPainPointsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ", route: '/BlitzInnovationFramework'),
  Bread(label: "Problem Study ", route: '/Problemstudy'),
  Bread(label: "Add Pain Points ", route: '/addpainpoints'),
];

class _AddPainPointsState extends State<AddPainPoints> {
  bool spinner = false;
  final _firestore = Firestore.instance;

  @override
  void initState() {
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
        child: Column(
          children: <Widget>[
            Wrap(children: [
              Breadcrumb(breads: breads, color: Color(0xFFE95420))
            ]),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
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
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Add details of the foundational aspects of the business',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: _firestore
                                  .collection(
                                      '$currentUser/StudyTheProblem/painPoints')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final messsages =
                                      snapshot.data.documents.reversed;
                                  AddingNewPainPoint = [];
                                  for (var message in messsages) {
                                    final Consequence =
                                        message.data['Consequence'];
                                    final MoreDetails =
                                        message.data['MoreDetails'];
                                    final Challenge = message.data['Challenge'];
                                    final Addresspp = message.data['Addresspp'];
                                    final Expectations =
                                        message.data['Expectations'];
                                    final ID = message.documentID;

                                    final card = addPainPoints(
                                        Consequence: Consequence,
                                        MoreDetails: MoreDetails,
                                        Challenge: Challenge,
                                        Addresspp: Addresspp,
                                        Expectations: Expectations,
                                        ID: ID);
                                    AddingNewPainPoint.add(card);
                                  }
                                }

                                return (AddingNewPainPoint.length != 0)
                                    ? ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: AddingNewPainPoint.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 10.0),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: <Widget>[
                                              SmallOrangeCardWithoutTitle(
                                                description:
                                                    AddingNewPainPoint[index]
                                                        .Challenge,
                                                index: index,
                                                removingat: AddingNewPainPoint,
                                                Dialogue: painpointDialogue(
                                                    index: index),
                                                CollectionName:
                                                    '$currentUser/StudyTheProblem/painPoints',
                                                ID: AddingNewPainPoint[index]
                                                    .ID,
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "There are no pain points at the moment. Would you like to add some? Use the '+’ button to get started.",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  headBackButtton(
                                    routeName: '/Problemstudy',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButtonBIF(
                                    buttonName: 'COMPLETE STEP',
                                    routeName: '/BlitzInnovationFramework',
                                    step: 0,
                                    stepBool: true,
                                  ),
//                              CompleteStepButton(
//                                OnTap: () {
//                                  bcpData[0].CompletionValidator = true;
//                                  print(bcpData[0].CompletionValidator);
//                                  Navigator.pushNamed(
//                                      context, '/BlitzInnovationFramework');
//                                },
//                              ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DotsIndicator(
                        decorator: DotsDecorator(
                          activeColor: const Color(0xFFE95420),
                        ),
                        dotsCount: 2,
                        position: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
              builder: (BuildContext context) => painpointDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
