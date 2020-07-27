import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/BCanvasIntroCard.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/BCStepCard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

const activeOrangeColour = Color(0XFFE95420);
const inactiveBlackColour = Color(0xFF274C4B);

BcFrameworkContent _frameworkContent = BcFrameworkContent();

class BCScreen extends StatefulWidget {
  final List<int> stepsList;
  final int completeStep1;
  BCScreen({Key key, this.stepsList, @required this.completeStep1, });
  @override
  _BCScreenState createState() => _BCScreenState(completeStep1, stepsList);
}

class _BCScreenState extends State<BCScreen> {
  List stepsList;
  int completeStep1;
  _BCScreenState(this.completeStep1, this.stepsList);

  List<int> selectedIndexList = [];

//  @override
//  void initState() {
//    selectedIndexList.add(completeStep1);
//    print(selectedIndexList);
//    super.initState();
//  }

  List<int> numbers = new List<int>();

  void addItem(int completeStep1) {

    int i = completeStep1;
    selectedIndexList.insert(i, completeStep1);
    print(selectedIndexList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //distance from the bar to the tittle
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  'Blitz Canvas',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BCanvasIntroCard(menuContents[1]),
            SizedBox(height:50.0),
            Padding(
              padding: const EdgeInsets.only(left: 300, right: 300),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bcStepsContent.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1.5,
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
//                  if (!completeStep1.contains(bcStepsContent[index])) {
//                    selectedIndexList.add(index);
//                  } else {
//                    selectedIndexList.remove(index);
//                  }

//                  if (completeStep1 != null) {
//                    selectedIndexList.insert(index, completeStep1);
//                  }

                  return BcStepCard(

                      //completeStep1: completeStep1,
                      frameWorkIcon: bcStepsContent[index].frameWorkIcon,
                      frameworkStep: bcStepsContent[index].frameworkStep,
                      frameWorkDescription: bcStepsContent[index].frameWorkDescription,
                      //cardColour: index+1 == completeStep1? inactiveBlackColour: activeOrangeColour,

                      cardColour: selectedIndexList.contains(index+1) ? inactiveBlackColour : activeOrangeColour,
                      buttonText: index +1 == completeStep1? 'Done': bcStepsContent[index].buttonText,
                      //buttonText: _validateCompletion(),
                      navigateTo: bcStepsContent[index].navigateTo);
                },
              ),
            ),
            SizedBox(height:20.0),
//            Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                BcStepCard(bcStepsContent[0]),
//                BcStepCard(bcStepsContent[1]),
//              ],
//            ),
          ],
        ),
      ),
    );
  }
}

class DoneRaisedButton extends StatelessWidget {
//  ReusableRaisedButton({@required this.routeTo, this.textButton});
//  final String routeTo;
//  final String textButton;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      //hoverElevation: 10,
      color: inactiveBlackColour,
      onPressed: () {
        //CHANGE IT
        //Navigator.pushNamed(context, routeTo);
      },
      child: Icon(Icons.check, color: Colors.grey,),
    );
  }
}