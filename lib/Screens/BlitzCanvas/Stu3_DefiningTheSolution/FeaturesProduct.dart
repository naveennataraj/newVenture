import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/ContentBcFeatureProduct.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/FeaturesDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class BcProductFeature extends StatefulWidget {
  @override
  _BcProductFeatureState createState() => _BcProductFeatureState();
}

class _BcProductFeatureState extends State<BcProductFeature> {
  final _firestore = Firestore.instance;

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
                      "List of the Product Features for the solution concept",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            '$currentUser/Bc3_definingTheSolution/addFeatures')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents.reversed;
                        print('these are the messages $messages');
                        addingNewProductFeature = [];
                        for (var message in messages) {
                          final FeatureTitle = message.data['featureTitle'];
                          final FeatureDescription =
                              message.data['featureDescription'];
                          final FeatureChecked = message.data['featureChecked'];
                          final FeatureType = message.data['featureType'];
                          final ID = message.documentID;

                          final card = ContentBcFeatureProduct(
                            FeatureTitle: FeatureTitle,
                            FeatureDescription: FeatureDescription,
                            FeatureChecked: FeatureChecked,
                            FeatureType: FeatureType,
                            ID: ID,
                          );
                          addingNewProductFeature.add(card);
                        }
                      }

                      return (addingNewProductFeature.length != 0)
                          ? ListView.builder(
                              itemCount: addingNewProductFeature.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: addingNewProductFeature != null
                                      ? <Widget>[
                                          SmallOrangeCardWithTitle(
                                            title:
                                                addingNewProductFeature[index]
                                                    .FeatureTitle,
                                            description:
                                                addingNewProductFeature[index]
                                                    .FeatureDescription,
                                            index: index,
                                            removingat: addingNewProductFeature,
                                            Dialogue:
                                                Step3BCProductFeatureDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/Bc3_definingTheSolution/addFeatures',
                                            ID: addingNewProductFeature[index]
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
                                  Text(
                                    "Click on '+' to add the Pain Points",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            );
                    },
                  ),

//                  (addingNewProductFeature.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the Product Goals",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      :
//                  ListView.builder(
//                    itemCount: addingNewProductFeature.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: addingNewProductFeature != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: addingNewProductFeature[index]
//                                .FeatureTitle,
//                            description:
//                            addingNewProductFeature[index]
//                                .FeatureDescription,
//                            index: index,
//                            removingat: addingNewProductFeature,
//                            Dialogue: Step3BCProductFeatureDialogue(
//                              index: index,
//                            ),
//                          )
//                        ]
//                            : null,
//                      );
//                    },
//                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        GenericStepButton(
                          buttonName: 'GO NEXT',
                          routeName: '/BCStep3WireFrameLink',
                          step: 2,
                          stepBool: false,
//                          OnTap: () {
//                            bcStepsContent[2].bcCompletionValidator = false;
//                            Navigator.pushNamed(
//                                context, '/BCStep3WireFrameLink');
//                          },
                          //routeName: '/BCStep3WireFrameLink',
                          // write here
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
                  Step3BCProductFeatureDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
