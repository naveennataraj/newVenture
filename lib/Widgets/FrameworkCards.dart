import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class FrameworkCards extends StatefulWidget {
  FrameworkCards(
      {this.frameworkicon,
      this.frameworkStep,
      this.frameworkdescrip,
      this.buttonText,
      this.navigateTo,
      this.stepCompleteValidator,
      this.daysRemaining});

  final IconData frameworkicon;
  final String frameworkStep;
  final String frameworkdescrip;
  final String buttonText;
  final String navigateTo;
  var daysRemaining;
  bool stepCompleteValidator;
  @override
  _FrameworkCardsState createState() => _FrameworkCardsState();
}

String days;

class _FrameworkCardsState extends State<FrameworkCards> {
  @override
  void initState() {
    days = widget.daysRemaining.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.white,
        elevation: 5,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(widget.frameworkicon),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.frameworkStep,
                          style: (ResponsiveLayout.isMediumScreen(context) ? responsiveMediumCardTitleTextStyle: cardTitleTextStyle ),
                          //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                Text(
                  widget.frameworkdescrip,
                  style: (ResponsiveLayout.isMediumScreen(context) ? responsiveSmallCardBodyTextStyle: cardBodyTextStyle ),
                  //TextStyle(fontSize: 18),
                ),
                Flexible(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                (widget.stepCompleteValidator == null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: RaisedButton(
                              elevation: 5,
                              hoverElevation: 10,
                              color: Color(0XFFE95420),
                              onPressed: () {
                                Navigator.pushNamed(context, widget.navigateTo);
                              },
                              child: Text(
                                widget.buttonText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          (widget.daysRemaining != null)
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        widget.daysRemaining.toString(),
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 35),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Day(s) left',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                )
                              : Spacer(),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: RaisedButton(
                              elevation: 5,
                              hoverElevation: 10,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, widget.navigateTo);
                              },
                              child: Text(
                                'Review Step',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 100,
                            ),
                          ),
                          (widget.stepCompleteValidator == false)
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Colors.orange,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Icon(
                                    Icons.beenhere,
                                    color: Colors.green,
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
