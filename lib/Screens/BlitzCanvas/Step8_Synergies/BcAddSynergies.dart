import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step8_Synergies/BcSynergiesDialogue.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Widgets/BcSynergies.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Synergies", route: '/BCStep8Synergies'),
];


class BcAddSynergies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcSynergies(breads: breads, headBackRoute: '/BCHomeView', completeButtonRoute: '/BCHomeView');
  }
}
//
//class BcAddSynergies extends StatefulWidget {
//  @override
//  _BcAddSynergiesState createState() => _BcAddSynergiesState();
//}
//
//List<Bread> breads = [
//  Bread(label: "Home ", route: '/'),
//  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//  Bread(label: "Synergies", route: '/BCStep8Synergies'),
//];
//
//class _BcAddSynergiesState extends State<BcAddSynergies> {
//  final _firestore = Firestore.instance;
//  bool spinner = false;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0XFFFAFAFA),
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(60.0),
//        child: NavigationBar(),
//      ),
//      body: ModalProgressHUD(
//        inAsyncCall: spinner,
//        child: SingleChildScrollView(
//          child: Column(
//            children: [
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Wrap(children: [
//                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
//                ],),
//              ),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    children: [
//                      Container(
//                        //height: MediaQuery.of(context).size.height * .40,
//                        margin: EdgeInsets.only(top: 40.0),
//                        width: 600, // MediaQuery.of(context).size.width * .40,
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          //shape: BoxShape.rectangle,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.grey,
//                              offset: Offset(0.0, 1.0), //(x,y)
//                              blurRadius: 2.0,
//                            ),
//                          ],
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.symmetric(vertical: 10.0),
//                              child: Text(
//                                "Can we spot any Synergies between the Business segments?",
//                                style:
//                                cardTitleTextStyle,
//                                textAlign: TextAlign.center,
//                              ),
//                            ),
//
//                            StreamBuilder<QuerySnapshot>(
//                              stream: _firestore
//                                  .collection('$currentUser/Bc8_synergies/addSynergies')
//                                  .snapshots(),
//                              builder: (context, snapshot) {
//                                if (snapshot.hasData) {
//                                  final messages = snapshot.data.documents.reversed;
//                                  addingNewSynergies = [];
//                                  for (var message in messages) {
//                                    final synergyName = message.data['synergyName'];
//                                    final checkedValueProposition = message.data['checkedValueProposition'];
//                                    final checkedCustomerSegment = message.data['checkedCustomerSegment'];
//                                    final checkedRevenueStream = message.data['checkedRevenueStream'];
//                                    final checkedDistributionChannel = message.data['checkedDistributionChannel'];
//                                    final checkedCustomerRelationship = message.data['checkedCustomerRelationship'];
//                                    final checkedKeyActivity = message.data['checkedKeyActivity'];
//                                    final checkedKeyResource = message.data['checkedKeyResource'];
//                                    final checkedKeyPartner = message.data['checkedKeyPartner'];
//                                    final checkedCostStructure = message.data['checkedCostStructure'];
//                                    final synergyDescription =
//                                    message.data['synergyDescription'];
//                                    final synergyValues = message.data['synergyValues'];
//                                    final ID = message.documentID;
//
//                                    final card = ContentSynergies(
//                                      synergyName: synergyName,
//                                      synergyValueProposition: checkedValueProposition,
//                                      synergyCustomerSegment: checkedCustomerSegment,
//                                      synergyRevenueStream: checkedRevenueStream,
//                                      synergyDistributionChannel: checkedDistributionChannel,
//                                      synergyCustomerRelationship: checkedCustomerRelationship,
//                                      synergyKeyActivity: checkedKeyActivity,
//                                      synergyKeyResource:checkedKeyResource,
//                                      synergyKeyPartner: checkedKeyPartner,
//                                      synergyCostStructure: checkedCostStructure,
//                                      synergyDescription: synergyDescription,
//                                      synergyValues: synergyValues,
//                                      ID: ID,
//                                    );
//                                    addingNewSynergies.add(card);
//                                  }
//                                }
//                                return (addingNewSynergies.length != 0)
//                                    ? ListView.builder(
//                                  itemCount: addingNewSynergies.length,
//                                  shrinkWrap: true,
//                                  padding: EdgeInsets.only(top: 10.0),
//                                  itemBuilder: (context, index) {
//                                    return Column(
//                                      children: addingNewSynergies != null
//                                          ? <Widget>[
//                                        SmallOrangeCardWithTitle(
//                                          title: addingNewSynergies[index]
//                                              .synergyName,
//                                          description:
//                                          addingNewSynergies[index]
//                                              .synergyDescription,
//                                          index: index,
//                                          removingat: addingNewSynergies,
//                                          Dialogue: BcSynergiesDialogue(
//                                            index: index,
//                                          ),
//                                          CollectionName:
//                                          '$currentUser/Bc8_synergies/addSynergies',
//                                          ID: addingNewSynergies[index].ID,
//                                        )
//                                      ]
//                                          : null,
//                                    );
//                                  },
//                                )
//                                    :
//                                Padding(
//                                  padding: const EdgeInsets.all(25.0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: [
//                                      Expanded(
//                                        child: Text(
//                                            "There are no synergies listed at the moment.\n Would you like to add some? Use the '+’ button to get started.",
//                                            style: emptyStateTextStyle, textAlign: TextAlign.center,
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                );
//                              },
//                            ),
//
//                            Padding(
//                              padding: const EdgeInsets.all(30.0),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  headBackButtton(
//                                    routeName: '/BCHomeView',
//                                  ),
//                                  SizedBox(
//                                    width: 50,
//                                  ),
//                                  GenericStepButton(
//                                    buttonName: 'COMPLETE STEP',
//                                    routeName: '/BCHomeView',
//                                    step: 7,
//                                    stepBool: true,
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  )
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              DotsIndicator(
//                decorator: DotsDecorator(
//                  activeColor: const Color(0xFFE95420),
//                ),
//                dotsCount: 1,
//                position: 0,
//              ),
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: Container(
//        margin: EdgeInsets.all(100),
//        child: FloatingActionButton(
//          tooltip: "Add's New Card",
//          backgroundColor: Color(0XFFE95420),
//          onPressed: () {
//            showDialog(
//              context: context,
//              builder: (BuildContext context) => BcSynergiesDialogue(),
//            ).then((_) => setState(() {}));
//          },
//          child: Icon(Icons.add),
//        ),
//      ),
//    );
//  }
//}
