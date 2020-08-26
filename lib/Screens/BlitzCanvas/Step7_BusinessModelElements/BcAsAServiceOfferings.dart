import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/AsAServiceDialogue.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcAsaServiceOffering extends StatefulWidget {
  @override
  _BcAsaServiceOfferingState createState() => _BcAsaServiceOfferingState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Model Elements ", route: '/BCStep7BusinessModelElements'),
  Bread(label: "Add Foundational Aspects", route: '/BCStep7IntellectualAssets'),
  Bread(label: "'As a service' offerings", route: '/BCStep7ServiceOffering'),
];

class _BcAsaServiceOfferingState extends State<BcAsaServiceOffering> {
  final _firestore = Firestore.instance;
  bool spinner = false;
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
                                "List of 'As a service' offerings",
                                style: cardTitleTextStyle,
                                textAlign: TextAlign.center,
                              ),),

                            StreamBuilder<QuerySnapshot>(
                              stream: _firestore
                                  .collection(
                                  '$currentUser/Bc7_businessModelElements/addServices')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final messages = snapshot.data.documents.reversed;
                                  addingAsaService = [];
                                  for (var message in messages) {
                                    final serviceName = message.data['serviceName'];
                                    final serviceDescription =
                                    message.data['serviceDescription'];
                                    final serviceType = message.data['serviceType'];
                                    final parentCompany = message.data['parentCompany'];
                                    final serviceTaskDescription = message.data['serviceTaskDescription'];
                                    final servicePercentage = message.data['servicePercentage'];

                                    final ID = message.documentID;

                                    final card = AddAsaServiceOffering(
                                      serviceName: serviceName,
                                      serviceDescription: serviceDescription,
                                      serviceType: serviceType,
                                      parentCompany: parentCompany,
                                      serviceTaskDescription: serviceTaskDescription,
                                      servicePercentage: servicePercentage,
                                      ID: ID,
                                    );
                                    addingAsaService.add(card);
                                  }
                                }

                                return (addingAsaService.length != 0)
                                    ? ListView.builder(
                                  itemCount: addingAsaService.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: addingAsaService != null
                                          ? <Widget>[
                                        SmallOrangeCardWithTitle(
                                          title:
                                          addingAsaService[index]
                                              .serviceName,
                                          description:
                                          addingAsaService[index]
                                              .serviceTaskDescription,
                                          index: index,
                                          removingat: addingAsaService,
                                          Dialogue:
                                          BcAsaServiceDialogue(
                                            index: index,
                                          ),
                                          CollectionName:
                                          '$currentUser/Bc7_businessModelElements/addServices',
                                          ID: addingAsaService[index]
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
                                          "There are no offerings listed at the moment.\n Would you like to add some? Use the '+’ button to get started.",
                                          style: emptyStateTextStyle, textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),

//                  (addingAsaService.length == 0)
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
//                    itemCount: addingAsaService.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: addingAsaService != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: addingAsaService[index]
//                                .serviceName,
//                            description:
//                            addingAsaService[index]
//                                .serviceTaskDescription,
//                            index: index,
//                            removingat: addingAsaService,
//                            Dialogue: BcAsaServiceDialogue(
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
                                    buttonName: 'COMPLETE STEP 7',
                                    routeName: '/BCHomeView',
                                    step: 6,
                                    stepBool: true,

//                          OnTap: () {
//                            bcStepsContent[6].bcCompletionValidator = true;
//                            Navigator.pushNamed(
//                                context, '/BCHomeView');
//                          },
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
                position: 2,
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
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => BcAsaServiceDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
