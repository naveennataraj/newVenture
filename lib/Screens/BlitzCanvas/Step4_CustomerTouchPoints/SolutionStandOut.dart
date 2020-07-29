import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class UniqueSellingProposition extends StatefulWidget {
  @override
  _UniqueSellingPropositionState createState() => _UniqueSellingPropositionState();
}

class _UniqueSellingPropositionState extends State<UniqueSellingProposition> {
  bool validProposition = true;
  var propositionLabelColor = Color(0XFF919191);
  var propositionTextController = TextEditingController();
  final propositionFocusNode = new FocusNode();
  String sellingProposition;

//  NotifyProgress() {
//    setState(() {
//      bcpData[1].CompletionValidator = false;
//      print(bcpData[1].CompletionValidator);
//    });
//  }

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
                        'How does this solution stand out?',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  TextFieldWidget(
                    labelText: "What is the unique selling proposition of this solution",
                    maxLines: 1,
                    validText: validProposition,
                    myFocusNode: propositionFocusNode,
                    myTextController: propositionTextController,
                    textCollecter: sellingProposition,
                    helperText: '',
                    labelcolour: propositionLabelColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        goNextButton(
                          OnTap: () {
                            bcStepsContent[3].bcCompletionValidator = false;
//                            bcpData[0].CompletionValidator = false;
//                            print(bcpData[0].CompletionValidator);
                            Navigator.pushNamed(context, '/BCStep4ConsumerTouchPoints');
                          },
                          //StepValidator: NotifyProgress(),

                          //routeName: '/BCStep4ConsumerTouchPoints',
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

