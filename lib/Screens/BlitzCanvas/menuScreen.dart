import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/BCanvasIntroCard.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/BCStepCard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class BCScreen extends StatelessWidget {


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
                  return BcStepCard(
                      frameWorkIcon: bcStepsContent[index].frameWorkIcon,
                      frameworkStep: bcStepsContent[index].frameworkStep,
                      frameWorkDescription: bcStepsContent[index].frameWorkDescription,

                      buttonText: bcStepsContent[index].buttonText,
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
