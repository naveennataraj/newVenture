import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class DashboardCards extends StatefulWidget {
  const DashboardCards({
    Key key,
    this.cardTitle,
    this.cardIcon,
    this.cardNote,
    this.cardButtonName,
    this.onTap,
  }) : super(key: key);
  final String cardTitle;
  final IconData cardIcon;
  final String cardNote;
  final String cardButtonName;
  final Function onTap;

  @override
  _DashboardCardsState createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Container(
        width: 300,
        color: Colors.white,
        child: Material(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(widget.cardIcon),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.cardTitle,
                          style: cardTitleTextStyle,
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
                  widget.cardNote,
                  style: cardBodyTextStyle,
                  //TextStyle(fontSize: 18),
                ),
                Flexible(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                (widget.cardButtonName != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 20),
                            child: GestureDetector(
                              onTap: widget.onTap,
                              child: Text(
                                widget.cardButtonName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFE95420),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
