import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/addPainPointsData.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddFoundationalDetail extends StatefulWidget {
  final int index;
  const AddFoundationalDetail({this.index});
  @override
  _AddFoundationalDetailState createState() =>
      _AddFoundationalDetailState(index);
}

var descriptionLabelColor = Color(0XFF919191);
bool validDescription = true;
var goalTextController = TextEditingController();
final descriptionFocusNode = FocusNode();
String descriptionText;

var coreCompetenceTextController = TextEditingController();
var coreCulturalAspectTextController = TextEditingController();

var AsalabelColor = Color(0XFF919191);
bool validAsa = true;
var AsaTextController = TextEditingController();
final AsaFocusNode = new FocusNode();
String Asa;

class _AddFoundationalDetailState extends State<AddFoundationalDetail> {
  int index;
  _AddFoundationalDetailState(this.index);

  //Radio buttons
  List foundational = ["goal", "core competence", "core cultural aspect"];
  String select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.lightBlueAccent,
          value: foundational[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    if (index != null) {
      goalTextController =
          TextEditingController(text: foundationContent[index].goal);
      coreCompetenceTextController =
          TextEditingController(text: foundationContent[index].coreCompetence);
      coreCulturalAspectTextController = TextEditingController(
          text: foundationContent[index].coreCulturalAspect);

      AsaTextController =
          TextEditingController(text: AddingNewPainPoint[index].Challenge);
//      IWantToTextController =
//          TextEditingController(text: AddingNewPainPoint[index].MoreDetails);
//      SoThatTextController =
//          TextEditingController(text: AddingNewPainPoint[index].Consequence);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width * 0.4,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    "Add a Foundational Detail:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    //textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Text('This detail is a '),
                    addRadioButton(0, 'goal'),
                    addRadioButton(1, 'core competence'),
                    addRadioButton(2, 'core cultural aspect'),
                  ],
                ),
                TextFieldWidget(
                  labelText: "Provide a description for this detail",
                  maxLines: 3,
                  validText: validAsa,
                  myFocusNode: AsaFocusNode,
                  myTextController: AsaTextController,
                  textCollecter: Asa,
                  helperText:
                      'Pleasure ensure that the appropiate type is selected before entering the description',
                  labelcolour: AsalabelColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddDetailButton(
                        routeName: '/addpainpoints',
                        onTap: () {
                          setState(() {
                            final NewUserStory = addUserStories(
                              Asa: AsaTextController.text,
                            );
                            if (index == null) {
                              AddingNewUserStory.add(NewUserStory);
                            } else {
                              AddingNewUserStory.removeAt(index);
                              AddingNewUserStory.insert(index, NewUserStory);
                            }
//
                            AsaTextController.clear();

                            Navigator.pop(context);
                          });
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
