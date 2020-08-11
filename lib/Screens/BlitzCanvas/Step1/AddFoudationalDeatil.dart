import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Widgets/AddProductFeatureButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';


class AddFoundationalDetail extends StatefulWidget {
  final int index;
  const AddFoundationalDetail({this.index});
  @override
  _AddFoundationalDetailState createState() =>
      _AddFoundationalDetailState(index);
}

var foundationDescriptionLabelColor = Color(0XFF919191);
bool validFoundation = true;
var foundationTextController = TextEditingController();
final foundationFocusNode = new FocusNode();
String foundationText;


class _AddFoundationalDetailState extends State<AddFoundationalDetail> {
  int index;
  final _firestore = Firestore.instance;
  int clickedRadio;
  String clickRadioName;
  //var timestamp = FieldValue.serverTimestamp();
  var radio1Focus = new FocusNode();
  var radio2Focus = new FocusNode();
  var radio3Focus = new FocusNode();

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  _AddFoundationalDetailState(this.index);

  @override
  void initState() {
    super.initState();

    if (index != null) {
      foundationTextController = TextEditingController(
          text: foundationContent[index].description);
      clickRadioName = foundationContent[index].title;
      clickedRadio = foundationContent[index].featureType;
    }
  }

  @override
  void dispose() {
    radio1Focus.dispose();
    radio3Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
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
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Add a Foundational Detail:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: (radio1Focus.hasFocus ||
                              radio2Focus.hasFocus ||
                              radio3Focus.hasFocus
                              )
                              ? Border.all(width: 1.2, color: Color(0XFFE95420))
                              : Border.all(width: 1, color: Color(0XFFABABAB)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:15.0, left: 15.0),
                            child: Text(
                              'The details is a:',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Row(
                            //mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text('Goal'),
                                  leading: Radio(
                                    focusNode: radio1Focus,
                                    activeColor: Color(0XFFE95420),
                                    value: 1,
                                    groupValue: clickedRadio,
                                    onChanged: (selectedRadio) {
                                      setState(() {
                                        requestFocus(radio1Focus);
                                        clickedRadio = selectedRadio;
                                        clickRadioName = 'Goal';
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text('Core competence'),
                                  leading: Radio(
                                    focusNode: radio2Focus,
                                    activeColor: Color(0XFFE95420),
                                    value: 2,
                                    groupValue: clickedRadio,
                                    onChanged: (selectedRadio) {
                                      setState(() {
                                        requestFocus(radio2Focus);
                                        clickedRadio = selectedRadio;
                                        clickRadioName = 'Core competence';
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text('Core cultural aspect'),
                                  leading: Radio(
                                    focusNode: radio3Focus,
                                    activeColor: Color(0XFFE95420),
                                    value: 3,
                                    groupValue: clickedRadio,
                                    onChanged: (selectedRadio) {
                                      setState(() {
                                        requestFocus(radio3Focus);
                                        clickedRadio = selectedRadio;
                                        clickRadioName = 'Core cultural aspect';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    TextFieldWidget(
                      labelText: "Provide a description for this detail",
                      maxLines: 1,
                      validText: validFoundation,
                      myFocusNode: foundationFocusNode,
                      myTextController: foundationTextController,
                      textCollecter: foundationText,
                      helperText:
                      'Please ensure that the appropiate type is selected before entering the description',
                      labelcolour: foundationDescriptionLabelColor,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddProductFeatureButton(
                            routeName: '/BCStep1AddDetails',
                            onTap: () {
                              setState(() {
                                final NewProductFeature = ContentBcAddFoundation(
                                    title: clickRadioName,
                                    description: foundationTextController.text,
                                    featureType: clickedRadio
                                );

                                if (index == null) {
                                  foundationContent.add(NewProductFeature);
                                  _firestore.collection('$currentUser/Bc1_buildTheFoundation/addFoundations').add({
                                    'title': clickRadioName,
                                    'featureType': clickedRadio,
                                    'description': foundationTextController.text,
                                    'Sender': currentUser,
                                    //'updatedAt': timestamp,
                                  });
                                } else {
//                                  foundationContent.removeAt(index);
//                                  foundationContent.insert(
//                                      index, NewProductFeature);
                                  _firestore
                                      .collection('$currentUser/Bc1_buildTheFoundation/addFoundations')
                                      .document(foundationContent[index].ID)
                                      .updateData({
                                    'title': clickRadioName,
                                    'featureType': clickedRadio,
                                    'description': foundationTextController.text,
                                    'Sender': currentUser,
                                  });
                                }
                                foundationTextController.clear();
                                clickedRadio = 0;
                                clickRadioName = '';
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              foundationTextController.clear();
                              clickedRadio = 0;
                              clickRadioName = '';
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),);
  }
}

