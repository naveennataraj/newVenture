import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcElements.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcBusinessElementsDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Widgets/ValidationDialogue.dart';
import 'package:iventure001/Widgets/MaximumCardsDialog.dart';

class BcModelElements extends StatefulWidget {
  final List breads;
  final String headBackRoute;
  final String goNextRoute;
  BcModelElements({this.breads, this.headBackRoute, this.goNextRoute});
  @override
  _BcModelElementsState createState() => _BcModelElementsState(breads, headBackRoute, goNextRoute);
}

class _BcModelElementsState extends State<BcModelElements> {
  final _firestore = Firestore.instance;
  bool spinner = false;
  List breads;
  String headBackRoute;
  String goNextRoute;
  _BcModelElementsState(this.breads, this.headBackRoute, this.goNextRoute);

  @override
  void initState() {
//    spinner = true;

    if (currentUser != null) {
    } else {
      _AnimatedFlutterLogoState();
    }

    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
        }
      });
    });
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
                ],),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height * .40,
                          margin: EdgeInsets.only(top: 40.0),
                          width: 600, //MediaQuery.of(context).size.width * .40,
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
                                  "Add business model elements \n (Based on the Business model canvas methodology)",
                                  style: cardTitleTextStyle,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),),


                              StreamBuilder<QuerySnapshot>(
                                stream: _firestore
                                    .collection(
                                    '$currentUser/Bc7_businessModelElements/addElements')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final messages = snapshot.data.documents.reversed;
                                    addingNewBusinessElement = [];
                                    for (var message in messages) {
                                      final elementTitle = message.data['elementTitle'];
                                      final elementDescription =
                                      message.data['elementDescription'];
                                      final elementChecked = message.data['elementChecked'];
                                      final ID = message.documentID;

                                      final card = ContentBcElements(
                                        elementTitle: elementTitle,
                                        elementDescription: elementDescription,
                                        elementChecked: elementChecked,
                                        ID: ID,
                                      );
                                      addingNewBusinessElement.add(card);
                                    }
                                  }

                                  return (addingNewBusinessElement.length != 0)
                                      ? ListView.builder(
                                    itemCount: addingNewBusinessElement.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(top: 10.0),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: addingNewBusinessElement != null
                                            ? <Widget>[
                                          SmallOrangeCardWithTitle(
                                            title:
                                            addingNewBusinessElement[index]
                                                .elementTitle,
                                            description:
                                            addingNewBusinessElement[index]
                                                .elementDescription,
                                            index: index,
                                            removingat: addingNewBusinessElement,
                                            Dialogue:
                                            BcBusinessElementsDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                            '$currentUser/Bc7_businessModelElements/addElements',
                                            ID: addingNewBusinessElement[index]
                                                .ID,
                                          )
                                        ]
                                            : null,
                                      );
                                    },
                                  )
                                      : Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "There are no business model elements at the moment.\n Would you like to add some? Use the '+’ button to get started.",
                                            style: emptyStateTextStyle, textAlign: TextAlign.center,
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
                                      routeName: headBackRoute,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    GenericStepButton(
                                      buttonName: 'GO NEXT',
                                      //routeName: '/BCStep7IntellectualAssets',
                                      step: 6,
                                      stepBool: false,
                                      widget: () {
                                        var countValue = addingNewBusinessElement
                                            .where(
                                                (valuePreposition) => valuePreposition.elementTitle == 'Value proposition')
                                            .toList()
                                            .length;
                                        var countCustomer = addingNewBusinessElement
                                            .where(
                                                (valueCustomer) => valueCustomer.elementTitle == 'Customer segment')
                                            .toList()
                                            .length;
                                        var countStream = addingNewBusinessElement
                                            .where(
                                                (valueStream) =>  valueStream.elementTitle == 'Revenue stream')
                                            .toList()
                                            .length;

                                        (countValue > 0 && countCustomer > 0 && countStream > 0)
                                            ?  Navigator.pushNamed(
                                            context, goNextRoute)
                                            : showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              ValidationDialogue(contentDescription: 'At the least 1 Value proposition, 1 Customer Segment and 1 Revenue stream needs to be added before proceeding next.',),
                                        );

                                      },

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE95420),
                ),
                dotsCount: 3,
                position: 0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(100),
        child: FloatingActionButton(
          tooltip: "Add's New Card",
          backgroundColor: Color(0XFFE95420),
          onPressed: (addingNewBusinessElement.length < 18)
              ? () {
            showDialog(
              context: context,
              builder: (BuildContext context) => BcBusinessElementsDialogue(),
            ).then((_) => setState(() {}));
          } : () {
            showDialog(
              context: context,
              builder: (BuildContext context) => MaximumCardsDialog(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
