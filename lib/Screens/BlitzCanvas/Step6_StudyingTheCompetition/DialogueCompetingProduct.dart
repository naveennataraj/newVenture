import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step6_StudyingTheCompetition/ContentCompetingProduct.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcCompetingProductDialogue extends StatefulWidget {
  final int index;

  const BcCompetingProductDialogue({this.index});
  @override
  _BcCompetingProductDialogueState createState() => _BcCompetingProductDialogueState(index);
}


class _BcCompetingProductDialogueState extends State<BcCompetingProductDialogue> {
  final _firestore = Firestore.instance;
  int index;
  _BcCompetingProductDialogueState(this.index);

  var ProductNamelabelColor = Color(0XFF919191);
  bool validPProductName = true;
  var ProductNameTextController = TextEditingController();
  final ProductNameFocusNode = new FocusNode();
  String ProductName;

  var OrgNamelabelColor = Color(0XFF919191);
  bool validOrgName = true;
  var OrgNameTextController = TextEditingController();
  final OrgNameFocusNode = new FocusNode();
  String OrgName;

  var CompetingOfferinglabelColor = Color(0XFF919191);
  bool validCompetingOffering = true;
  var CompetingOfferingTextController = TextEditingController();
  final CompetingOfferingFocusNode = new FocusNode();
  String CompetingOffering;

  var SolutionOfferinglabelColor = Color(0XFF919191);
  bool validSolutionOffering = true;
  var SolutionOfferingTextController = TextEditingController();
  final SolutionOfferingFocusNode = new FocusNode();
  String SolutionOffering;

  validator() {
    setState(() {
      ProductNameTextController.text.isEmpty
          ? validPProductName = false
          : validPProductName = true;
      ProductNameTextController.text.isEmpty
          ? ProductNamelabelColor = Color(0xFFF53E70)
          : ProductNamelabelColor = Color(0xFF919191);
      OrgNameTextController.text.isEmpty
          ? validOrgName = false
          : validOrgName = true;
      OrgNameTextController.text.isEmpty
          ? OrgNamelabelColor = Color(0xFFF53E70)
          : OrgNamelabelColor = Color(0xFF919191);
      CompetingOfferingTextController.text.isEmpty
          ? validCompetingOffering = false
          : validCompetingOffering = true;
      CompetingOfferingTextController.text.isEmpty
          ? CompetingOfferinglabelColor = Color(0xFFF53E70)
          : CompetingOfferinglabelColor = Color(0xFF919191);
      SolutionOfferingTextController.text.isEmpty
          ? validSolutionOffering = false
          : validSolutionOffering = true;
      SolutionOfferingTextController.text.isEmpty
          ? SolutionOfferinglabelColor = Color(0xFFF53E70)
          : SolutionOfferinglabelColor = Color(0xFF919191);
    });
  }

  @override
  void initState() {
    super.initState();
    if (index != null) {
      ProductNameTextController = TextEditingController(
          text: AddingNewCompetingProduct[index].ProductName);
      OrgNameTextController =
          TextEditingController(text: AddingNewCompetingProduct[index].OrgName);
      CompetingOfferingTextController = TextEditingController(
          text: AddingNewCompetingProduct[index].Features);
      SolutionOfferingTextController = TextEditingController(
          text: AddingNewCompetingProduct[index].CurrentOffering);
    } else {
      ProductNameTextController.clear();
      OrgNameTextController.clear();
      CompetingOfferingTextController.clear();
      SolutionOfferingTextController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          //height: 600, // MediaQuery.of(context).size.height * 0.70,
          width: 800, //MediaQuery.of(context).size.width * 0.5,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a Competing Product:",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "What is the name of the product?",
                    maxLines: 3,
                    validText: validPProductName,
                    myFocusNode: ProductNameFocusNode,
                    myTextController: ProductNameTextController,
                    textCollecter: ProductName,
                    helperText:
                    'Enter the name of the comepting product here',
                    labelcolour: ProductNamelabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "Which organisation dies this product belong to?",
                    maxLines: 3,
                    validText: validOrgName,
                    myFocusNode: OrgNameFocusNode,
                    myTextController: OrgNameTextController,
                    textCollecter: OrgName,
                    helperText:
                    'Enter the name of the parent company of the product here',
                    labelcolour: OrgNamelabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "What are the features of the competing offering?",
                    maxLines: 3,
                    validText: validCompetingOffering,
                    myFocusNode: CompetingOfferingFocusNode,
                    myTextController: CompetingOfferingTextController,
                    textCollecter: CompetingOffering,
                    helperText: 'Mention each feature seperated by a comma',
                    labelcolour: CompetingOfferinglabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "Which of these features are to be included in your current solution offering?",
                    maxLines: 3,
                    validText: validSolutionOffering,
                    myFocusNode: SolutionOfferingFocusNode,
                    myTextController: SolutionOfferingTextController,
                    textCollecter: SolutionOffering,
                    helperText: 'Mention each feature seperated by a comma',
                    labelcolour: SolutionOfferinglabelColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        AddGenericButton(
                          buttonName:  'Add  Competing Product' ,
                          onTap: () {

                            if (ProductNameTextController.text != '' &&
                                OrgNameTextController.text != '' &&
                                CompetingOfferingTextController
                                    .text !=
                                    '' &&
                                SolutionOfferingTextController.text !=
                                    '') {
                              Navigator.pop(context);
                              setState(() {
                                final NewComponentProduct = BcCompetingProduct(
                                    ProductName: ProductNameTextController.text,
                                    OrgName: OrgNameTextController.text,
                                    Features:
                                    CompetingOfferingTextController.text,
                                    CurrentOffering:
                                    SolutionOfferingTextController.text);

                                if (index == null) {
                                  AddingNewCompetingProduct.add(
                                      NewComponentProduct);
                                  _firestore.collection('$currentUser/Bc6_studyingTheCompetition/addPlayers').add({
                                    'ProductName': ProductNameTextController.text,
                                    'OrgName': OrgNameTextController.text,
                                    'Features': CompetingOfferingTextController.text,
                                    'CurrentOffering': SolutionOfferingTextController.text,
                                    'Sender': currentUser,
                                  });


                                } else {
//                                  AddingNewCompetingProduct.removeAt(index);
//                                  AddingNewCompetingProduct.insert(
//                                      index, NewComponentProduct);
                                  _firestore
                                      .collection('$currentUser/Bc6_studyingTheCompetition/addPlayers')
                                      .document(AddingNewCompetingProduct[index].ID)
                                      .updateData({
                                    'ProductName': ProductNameTextController.text,
                                    'OrgName': OrgNameTextController.text,
                                    'Features': CompetingOfferingTextController.text,
                                    'CurrentOffering': SolutionOfferingTextController.text,
                                    'Sender': currentUser,
                                  },);
                                }


                                //Navigator.pop(context);

                              },);
                            } else{
                              validator();
                            }

                          },
                        ),
                        SizedBox(
                          width: (!ResponsiveLayout.isSmallScreen(context) ? 50 : 35),
                        ),
                        CancelButtton(
                          OnTap: () {
                            ProductNameTextController.clear();
                            OrgNameTextController.clear();
                            CompetingOfferingTextController.clear();
                            SolutionOfferingTextController.clear();

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
