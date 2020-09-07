import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step4_UniqueSellingProposition/BcSellingProposition.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Widgets/BcUniqueSellingProposition.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Solution", route: '/BCStep4SellingProposition'),
];

class UniqueSellingProposition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcUniqueSellingProposition(
      breads: breads, headBackRoute: '/BCHomeView', goNextRoute: '/BCStep4ConsumerTouchPoints',
    );
  }
}



//
//class UniqueSellingProposition extends StatefulWidget {
//  @override
//  _UniqueSellingPropositionState createState() => _UniqueSellingPropositionState();
//}
//
//String ID;
//
//List<Bread> breads = [
//  Bread(label: "Home ", route: '/'),
//  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//  Bread(label: "Solution", route: '/BCStep4SellingProposition'),
//];
//
//
//class _UniqueSellingPropositionState extends State<UniqueSellingProposition> {
//
//  final _firestore = Firestore.instance.collection(currentUser).document('Bc4_uniqueSellingProposition');
//  String propositionFirebaseData;
//  bool spinner = false;
//
//  bool validProposition = true;
//  var propositionLabelColor = Color(0XFF919191);
//  var propositionTextController = TextEditingController();
//  final propositionFocusNode = new FocusNode();
//  String sellingProposition;
//
//  void initState() {
//    super.initState();
//    (propositionFirebaseData  == null)? getDocuments() : {} ;
//  }
//
//  void getDocuments() async {
//    final document = await _firestore.get();
//
//    if (document.exists) {
//      try {
//        setState(() {
//          spinner = false;
//          sellingProposition = document.data['proposition'];
//          propositionFirebaseData = document.data['proposition'];
//          ID = document.documentID;
//          propositionTextController.text = sellingProposition;
//        });
//      } catch (e) {
//        print(e);
//      }
//      final fields = BcSellingProposition(
//          proposition: sellingProposition,
//          ID: ID);
//
//      sellingPropositionArray.insert(0,fields);
//    }else{
//      _firestore.collection(currentUser).document('Bc4_uniqueSellingProposition').setData(
//          {}
//      );
//    }
//  }
//
//  validator() {
//    setState(() {
//      propositionTextController.text.isEmpty
//          ? validProposition = false
//          : validProposition = true;
//      propositionTextController.text.isEmpty
//          ? propositionLabelColor = Color(0xFFF53E70)
//          : propositionLabelColor = Color(0xFF919191);
//    });
//  }
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
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Container(
//                        //height: MediaQuery.of(context).size.height * .40,
//                        margin: EdgeInsets.only(top: 40.0),
//                        width: 600, //MediaQuery.of(context).size.width * .40,
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
//                                padding: EdgeInsets.symmetric(vertical: 10.0),
//                                child: Text(
//                                  'How does this solution stand out?',
//                                  style: TextStyle(
//                                      fontSize: 22, fontWeight: FontWeight.bold),
//                                  textAlign: TextAlign.center,
//                                )),
//                            TextFieldWidget(
//                              labelText: "What is the unique selling proposition of this solution",
//                              maxLines: 3,
//                              validText: validProposition,
//                              myFocusNode: propositionFocusNode,
//                              myTextController: propositionTextController,
//                              textCollecter: sellingProposition,
//                              helperText: '',
//                              labelcolour: propositionLabelColor,
//                            ),
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
//                                    buttonName: 'GO NEXT',
//                                    //routeName: '/BCStep4ConsumerTouchPoints',
//                                    step: 3,
//                                    stepBool: false,
//                                    widget: (propositionTextController.text == '')
//                                        ? () {
//                                      validator();
//                                    }
//                                        : () {
//                                      (propositionTextController.text != '') ? Navigator.pushNamed(context, '/BCStep4ConsumerTouchPoints'): {};
//
//                                      if(sellingPropositionArray.length != 0) {
//                                        _firestore
//                                            .updateData({
//                                          'proposition': propositionTextController.text,
//                                        });
//                                      } else {
//                                        if (propositionFirebaseData != propositionTextController.text ) {
//                                          _firestore.setData({
//                                            'proposition': propositionTextController.text,
//                                            'keyTouchText': 'fg',
//                                            'capitalizeText': 'fg',
//                                            'growthText': 'fg',
//                                            'Sender': currentUser,
//                                          });
//                                        }
//                                      }
//                                      propositionFirebaseData = propositionTextController.text;
//
//                                    }
//
//                                  ),
//                                ],
//                              ),
//                            )
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
//                dotsCount: 2,
//                position: 0,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//
//}
//
