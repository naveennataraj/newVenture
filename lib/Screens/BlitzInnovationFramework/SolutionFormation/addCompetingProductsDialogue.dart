import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addCompetingProduct.dart';
import 'package:iventure001/Widgets/AddProductFeatureButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addCompetingProductsDialogue extends StatefulWidget {
  final int index;

  const addCompetingProductsDialogue({this.index});
  @override
  _addCompetingProductsDialogueState createState() =>
      _addCompetingProductsDialogueState(index);
}

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

class _addCompetingProductsDialogueState
    extends State<addCompetingProductsDialogue> {
  int index;

  _addCompetingProductsDialogueState(this.index);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.70,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
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
                      maxLines: 1,
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
                      maxLines: 1,
                      validText: validOrgName,
                      myFocusNode: OrgNameFocusNode,
                      myTextController: OrgNameTextController,
                      textCollecter: OrgName,
                      helperText:
                          'Enter the name of the parent comapny of the product here',
                      labelcolour: OrgNamelabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "What are the feature of the competing offering?",
                      maxLines: 1,
                      validText: validCompetingOffering,
                      myFocusNode: CompetingOfferingFocusNode,
                      myTextController: CompetingOfferingTextController,
                      textCollecter: CompetingOffering,
                      helperText: 'Mention each feature seperated by a comma',
                      labelcolour: CompetingOfferinglabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "Which of these feature are to be included in your current solution offering?",
                      maxLines: 1,
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
                          AddProductFeatureButton(
                            routeName: '/addproductgoals',
                            onTap: () {
                              setState(() {
                                final NewComponentProduct = addCompetingProduct(
                                    ProductName: ProductNameTextController.text,
                                    OrgName: OrgNameTextController.text,
                                    Features:
                                        CompetingOfferingTextController.text,
                                    CurrentOffering:
                                        SolutionOfferingTextController.text);

                                if (index == null) {
                                  AddingNewCompetingProduct.add(
                                      NewComponentProduct);
                                } else {
                                  AddingNewCompetingProduct.removeAt(index);
                                  AddingNewCompetingProduct.insert(
                                      index, NewComponentProduct);
                                }

                                ProductNameTextController.clear();
                                OrgNameTextController.clear();
                                CompetingOfferingTextController.clear();
                                SolutionOfferingTextController.clear();

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
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
          ),
        ));
  }
}
