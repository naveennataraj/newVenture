import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addProductFeaturesDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/MaximumCardsDialog.dart';
import 'package:iventure001/Widgets/MinimumCardsDialog.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddProductFeatures extends StatefulWidget {
  @override
  _AddProductFeaturesState createState() => _AddProductFeaturesState();
}

class _AddProductFeaturesState extends State<AddProductFeatures> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Product Goals ", route: '/addproductgoals'),
    Bread(label: "Add Product Feature ", route: '/addproductfeatures'),
  ];

  final _firestore = Firestore.instance;

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
        if (currentUser != null && currentUser != '') {}
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //height: MediaQuery.of(context).size.height * .40,
                      margin: EdgeInsets.only(top: 40.0),
                      width: 600,
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
                              "Let's list out the Product Features for the solution concept",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection(
                                    '$currentUser/SolutionFormulation/productFeatures')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final messsages =
                                    snapshot.data.documents.reversed;
                                AddingNewProductFeature = [];
                                for (var message in messsages) {
                                  final FeatureTitle =
                                      message.data['FeatureTitle'];
                                  final FeatureDescription =
                                      message.data['FeatureDescription'];
                                  final FeatureChecked =
                                      message.data['FeatureChecked'];
                                  final FeatureType =
                                      message.data['FeatureType'];
                                  final ID = message.documentID;

                                  final card = addProductFeature(
                                      FeatureTitle: FeatureTitle,
                                      FeatureDescription: FeatureDescription,
                                      FeatureChecked: FeatureChecked,
                                      FeatureType: FeatureType,
                                      ID: ID);
                                  AddingNewProductFeature.add(card);
                                }
                              }

                              return (AddingNewProductFeature.length != 0)
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: AddingNewProductFeature.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 10.0),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children:
                                              AddingNewProductFeature != null
                                                  ? <Widget>[
                                                      SmallOrangeCardWithTitle(
                                                        title:
                                                            AddingNewProductFeature[
                                                                    index]
                                                                .FeatureTitle,
                                                        description:
                                                            AddingNewProductFeature[
                                                                    index]
                                                                .FeatureDescription,
                                                        index: index,
                                                        removingat:
                                                            AddingNewProductFeature,
                                                        Dialogue:
                                                            addProductFeaturesDialogue(
                                                          index: index,
                                                        ),
                                                        CollectionName:
                                                            '$currentUser/SolutionFormulation/productFeatures',
                                                        ID: AddingNewProductFeature[
                                                                index]
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "There are no Product Features at the moment. Would you like to add some? Use the '+’ button to get started.",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                                  routeName: '/addproductgoals',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
//                                goNextButton(
////                          routeName: '/currentmarketplayers',
//                                  OnTap: () {
//                                    bcpData[3].CompletionValidator = false;
//                                    print(bcpData[3].CompletionValidator);
//                                    Navigator.pushNamed(
//                                        context, '/currentmarketplayers');
//                                  },
//                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'GO NEXT',
//                                    routeName: '/addpainpoints',
                                  step: 3,
                                  stepBool: false,
                                  widget: () {
                                    if (AddingNewProductFeature.length < 2) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            MinimumCardsDialog(
                                          minimumcards: 2,
                                        ),
                                      ).then((_) => setState(() {}));
                                    } else if (AddingNewProductFeature.length >=
                                        2) {
                                      Navigator.popAndPushNamed(
                                          context, '/currentmarketplayers');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
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
                      dotsCount: 4,
                      position: 1,
                    ),
                  ],
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
          onPressed: (AddingNewProductFeature.length < 18)
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        addProductFeaturesDialogue(),
                  ).then((_) => setState(() {}));
                }
              : () {
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
