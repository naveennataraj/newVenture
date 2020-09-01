import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/SpaceHeight30.dart';
import 'package:iventure001/Widgets/SpaceHeight20.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class BCanvasIntroCard extends StatelessWidget {

  final ContentFrameworkMenu bcMenuContent;
  BCanvasIntroCard(this.bcMenuContent);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
//        padding: EdgeInsets.only(
//          left: (MediaQuery.of(context).size.width >= 1400)
//              ? 30
//              : (MediaQuery.of(context).size.width <= 750) ? 5 : 10,
//          right: (MediaQuery.of(context).size.width >= 1400)
//              ? 30
//              : (MediaQuery.of(context).size.width <= 750) ? 5 : 30,
//        ),
        child: Container(
          height: (MediaQuery.of(context).size.width >= 1400) ?  150 : (MediaQuery.of(context).size.width <= 800) ? 200 :  (MediaQuery.of(context).size.width <= 800) ? 250 : 150,
        //300,
          width: (MediaQuery.of(context).size.width < 1400) ?  850 : MediaQuery.of(context).size.width * .50,
//        height: MediaQuery.of(context).size.height * .40,
//        width: MediaQuery.of(context).size.width * .50,
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  bcMenuContent.title,
                  style: menuIntroTextStyle,
                  textAlign: TextAlign.center,
                ),
                Space30(),
//                Text(
//                  bcMenuContent.paragraph1,
//                  style: menuIntroTextStyle,
//                  textAlign: TextAlign.center,
//                ),
//                Space20(),
//                Text(
//                  bcMenuContent.paragraph2,
//                  style: menuIntroBoldTextStyle,
//                  textAlign: TextAlign.center,
//
//                ),
//                Space20(),

               RichText(
              text: new TextSpan(
                style: menuIntroTextStyle,
                children: <TextSpan>[
                  new TextSpan(text: "Please choose the",),
                  new TextSpan(text: " \"Let\'s get started\" ", style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  new TextSpan(text: "button in card 1 to get started with the process.", ),
                ],
              ),
                 textAlign: TextAlign.center,
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
