import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iventure001/Widgets/SpaceHeight30.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

const activeOrangeColour = Color(0XFFE95420);
const inactiveBlackColour = Color(0xFF274C4B);

class BcStepCard extends StatelessWidget {

//  final String text;
//  BcStepCard({Key key, @required this.text}) : super(key: key);
//

  BcStepCard(
      {this.id, this.frameWorkIcon,
        this.frameworkStep,
        this.frameWorkDescription,
        this.buttonText,
        this.navigateTo,
        this.completeStep1,
        //this.text
      });

  final int id;
  final IconData frameWorkIcon;
  final String frameworkStep;
  final String frameWorkDescription;
  final String buttonText;
  final String navigateTo;
  final bool completeStep1;
  //final String text;

  //str3.lastIndexOf('completeStep1');


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Material(
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: 270,
          width: 300,
          //margin: EdgeInsets.only(bottom: 20.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //completeStep1 == true ? Icon(frameWorkIcon, size: 30.0, color: inactiveBlackColour,) : Icon(frameWorkIcon, size: 30.0, color: activeOrangeColour,),
                Icon(frameWorkIcon, size: 30.0, color: activeOrangeColour,),

                  //Icon(frameWorkIcon, size: 30.0, color: inactiveBlackColour,)
                SizedBox(height: 5.0,),
                Text(
                  frameworkStep,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Space30(),



                Text(frameWorkDescription, style: TextStyle(fontSize: 18, color: Colors.black54),),
                Space30(),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 25.0),

//completeStep1 == true ? DoneRaisedButton() : ReusableRaisedButton( routeTo: navigateTo, textButton: buttonText,),

                      // ignore: unrelated_type_equality_checks
                      child: completeStep1 == true ? DoneRaisedButton() : ReusableRaisedButton( routeTo: navigateTo, textButton: buttonText,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ReusableRaisedButton extends StatelessWidget {
  ReusableRaisedButton({@required this.routeTo, this.textButton});
  final String routeTo;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      hoverElevation: 10,
      color: activeOrangeColour,
      onPressed: () {
        //CHANGE IT
        Navigator.pushNamed(context, routeTo);
      },

      child: Text(
        textButton,
        //completeStep1 == true ? null : buttonText,

        style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.white),
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