import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrameworkCards extends StatelessWidget {
  FrameworkCards(
      {@required this.frameworkicon,
      @required this.frameworkStep,
      @required this.frameworkdescrip,
      @required this.buttonText,
      @required this.navigateTo});

  final IconData frameworkicon;
  final String frameworkStep;
  final String frameworkdescrip;
  final String buttonText;
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(frameworkicon),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      frameworkStep,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Flexible(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                Text(
                  frameworkdescrip,
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: RaisedButton(
                        elevation: 5,
                        hoverElevation: 10,
                        color: Color(0XFFE95420),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Problemstudy');
                        },
                        child: Text(
                          buttonText,
                          style: TextStyle(
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
