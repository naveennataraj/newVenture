import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/AddFoudationalDeatil.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:iventure001/Widgets/ValidationDialogue.dart';
import 'package:iventure001/Widgets/BcAFoundationalAspectsAdd.dart';


class Step1AddFoundation extends StatelessWidget {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
    Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
    Bread(label: "Aspects of the business", route: '/BCStep1AddDetails'),
  ];

  @override
  Widget build(BuildContext context) {
    return BcAddFoundationalAspects(
        breads: breads,
        completeButtonRoute: '/BCHomeView',
    );
  }
}

//
//class Step1AddFoundation extends StatefulWidget {
//  @override
//  _Step1AddFoundationState createState() => _Step1AddFoundationState();
//}
//
//class _Step1AddFoundationState extends State<Step1AddFoundation> {
//  bool spinner = false;
//  final _firestore = Firestore.instance;
//  List validatorList = [];
//  int count = 0;
//
//  List<Bread> breads = [
//    Bread(label: "Home ", route: '/'),
//    Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//    Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
//    Bread(label: "Aspects of the business", route: '/BCStep1AddDetails'),
//  ];
//
//
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
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Wrap(
//                    children: [
//                      Breadcrumb(
//                        breads:  breads,
//                        color: Color(0xFFE95420),
//                      )
//                    ],
//                  )),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    children: [
//                      Container(
//                        //height: MediaQuery.of(context).size.height * .40,
//                        margin: EdgeInsets.only(top: 40.0),
//                        width: 600,
//                        //MediaQuery.of(context).size.width * .40,
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
//                                "Add details of the foundational aspects of the business",
//                                style: cardTitleTextStyle,
//                                textAlign: TextAlign.center,
//                              ),
//                            ),
//                            StreamBuilder<QuerySnapshot>(
//                              stream: _firestore
//                                  .collection(
//                                      '$currentUser/Bc1_buildTheFoundation/addFoundations')
//                                  .snapshots(),
//                              builder: (context, snapshot) {
//                                if (snapshot.hasData) {
//                                  final messages =
//                                      snapshot.data.documents.reversed;
//                                  foundationContent = [];
//                                  for (var message in messages) {
//                                    final title = message.data['title'];
//                                    final description =
//                                        message.data['description'];
//                                    final featureType =
//                                        message.data['featureType'];
//                                    final ID = message.documentID;
//
//                                    final card = ContentBcAddFoundation(
//                                      title: title,
//                                      description: description,
//                                      featureType: featureType,
//                                      ID: ID,
//                                    );
//                                    foundationContent.add(card);
//                                  }
//                                }
//
//                                return (foundationContent.length != 0)
//                                    ? ListView.builder(
//                                        itemCount: foundationContent.length,
//                                        shrinkWrap: true,
//                                        padding: EdgeInsets.only(top: 10.0),
//                                        itemBuilder: (context, index) {
//                                          return Column(
//                                            children: <Widget>[
//                                              SmallOrangeCardWithTitle(
//                                                title: foundationContent[index]
//                                                    .title,
//                                                description:
//                                                    foundationContent[index]
//                                                        .description,
//                                                index: index,
//                                                removingat: foundationContent,
//                                                Dialogue: AddFoundationalDetail(
//                                                  index: index,
//                                                ),
//                                                CollectionName:
//                                                    '$currentUser/Bc1_buildTheFoundation/addFoundations',
//                                                ID: foundationContent[index].ID,
//                                              )
//                                            ],
//                                          );
//                                        },
//                                      )
//                                    : Padding(
//                                        padding: const EdgeInsets.all(25.0),
//                                        child: Row(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.center,
//                                          children: [
//                                            Expanded(
//                                              child: Text(
//                                                  "There are no Product Goals at the moment. Would you like to add some? Use the '+’ button to get started.",
//                                                  style: emptyStateTextStyle,
//                                                  textAlign: TextAlign.center),
//                                            )
//                                          ],
//                                        ),
//                                      );
//                              },
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(30.0),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  headBackButtton(
//                                      //headHome: true,
//                                      ),
//                                  SizedBox(
//                                    width: 50,
//                                  ),
//                                  GenericStepButton(
//                                      buttonName: 'COMPLETE STEP 1',
//                                      //routeName: '/BCHomeView',
//                                      step: 0,
//                                      stepBool: true,
//                                      widget: () {
//                                        var count = foundationContent
//                                            .where(
//                                                (Goal) => Goal.title == 'Goal')
//                                            .toList()
//                                            .length;
//                                        (count < 2)
//                                            ?
//                                        showDialog(
//                                          context: context,
//                                          builder: (BuildContext context) =>
//                                              ValidationDialogue(contentDescription: 'At least 2 goals are required before continuing to the next card.',),
//                                        )
//                                            : Navigator.pushNamed(
//                                                context, '/BCHomeView');
//                                      },
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              DotsIndicator(
//                decorator: DotsDecorator(
//                  activeColor: const Color(0xFFE95420),
//                ),
//                dotsCount: 2,
//                position: 1,
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
//              builder: (BuildContext context) => AddFoundationalDetail(),
//            ).then((_) => setState(() {}));
//          },
//          child: Icon(Icons.add),
//        ),
//      ),
//    );
//  }
//
//}
