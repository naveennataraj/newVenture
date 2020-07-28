import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrameworkCards extends StatefulWidget {
  FrameworkCards(
      {this.frameworkicon,
      this.frameworkStep,
      this.frameworkdescrip,
      this.buttonText,
      this.navigateTo,
      this.stepCompleteValidator});

  final IconData frameworkicon;
  final String frameworkStep;
  final String frameworkdescrip;
  final String buttonText;
  final String navigateTo;
  bool stepCompleteValidator;
  @override
  _FrameworkCardsState createState() => _FrameworkCardsState();
}

class _FrameworkCardsState extends State<FrameworkCards> {
  @override
  void initState() {
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
                Row(
                  children: [
                    Icon(widget.frameworkicon),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.frameworkStep,
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
                  widget.frameworkdescrip,
                  style: TextStyle(fontSize: 18),
                ),
                Flexible(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                (widget.stepCompleteValidator == null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        children: [
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
                                  padding: const EdgeInsets.only(right: 20.0),
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
