import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iventure001/Widgets/SpaceHeight30.dart';


class BcStepCard extends StatelessWidget {

  BcStepCard(
      {this.frameWorkIcon,
        this.frameworkStep,
        this.frameWorkDescription,
        this.buttonText,
        this.navigateTo});

  final IconData frameWorkIcon;
  final String frameworkStep;
  final String frameWorkDescription;
  final String buttonText;
  final String navigateTo;



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
                Icon(frameWorkIcon, size: 30.0,),
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
                      child: RaisedButton(
                        elevation: 5,
                        hoverElevation: 10,
                        color: Color(0XFFE95420),
                        onPressed: () {
                          //CHANGE IT
                          Navigator.pushNamed(context, navigateTo);
                        },
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
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
