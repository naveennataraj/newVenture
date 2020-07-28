import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddWireframeLink extends StatefulWidget {
  @override
  _AddWireframeLinkState createState() => _AddWireframeLinkState();
}

var WireFrameLinklabelColor = Color(0XFF919191);
bool validWireFrameLink = true;
var WireFrameLinkTextController = TextEditingController();
final WireFrameLinkFocusNode = new FocusNode();
String WireFrameLink;

class _AddWireframeLinkState extends State<AddWireframeLink> {
  NotifyProgress() {
    setState(() {
      bcpData[3].CompletionValidator = true;
      print(bcpData[3].CompletionValidator);
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
                      "Add the link to the Product Wireframe, if we have one handy:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        "Tip: For the prefered solution concept, a wireframe can be developed using a service such as AdobeXD or Marvel App. The purpose of this is to have the End user(s) interact with it, with the goal of eventually collecting feedback from them.",
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Learn More About Wireframes'),
                  ),
                  TextFieldWidget(
                    labelText:
                        "If the wireframe is already created, please enter the",
                    maxLines: 1,
                    validText: validWireFrameLink,
                    myFocusNode: WireFrameLinkFocusNode,
                    myTextController: WireFrameLinkTextController,
                    textCollecter: WireFrameLink,
                    helperText: '',
                    labelcolour: WireFrameLinklabelColor,
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
                        CompleteStepButton(
                          OnTap: () {
                            bcpData[3].CompletionValidator = true;
                            print(bcpData[3].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/BlitzInnovationFramework');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
