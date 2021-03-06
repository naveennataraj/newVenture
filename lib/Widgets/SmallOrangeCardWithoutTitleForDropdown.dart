import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/ranksolutions.dart';

import 'DeleteDialogDropDown.dart';

const cardColor = Color(0xFFF7C3B1);

class SmallOrangeCardWithoutTitleForDropDown extends StatefulWidget {
  final String description;
  final int index;
  final List removingat;
  Widget Dialogue;
  final String CollectionName;
  final ID;

  SmallOrangeCardWithoutTitleForDropDown(
      {this.description,
      this.index,
      this.removingat,
      this.Dialogue,
      this.CollectionName,
      this.ID});

  @override
  _SmallOrangeCardWithoutTitleForDropDownState createState() =>
      _SmallOrangeCardWithoutTitleForDropDownState();
}

//bool erased;

class _SmallOrangeCardWithoutTitleForDropDownState
    extends State<SmallOrangeCardWithoutTitleForDropDown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
//      erased
//        ? Container()
//        :
        GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, subject.pushView);
        print('working');
      },
      child: Container(
        height: 180,
        width: 370,
        margin: EdgeInsets.symmetric(horizontal: 46.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: cardColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => widget.Dialogue,
                      );
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      SolutionRankingList.removeAt(widget.index);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DeleteDialogDropDown(
                          ID: widget.ID,
                          CollectionName: widget.CollectionName,
                          description: widget.description,
                        ),
                      ).then((_) => setState(() {}));
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
