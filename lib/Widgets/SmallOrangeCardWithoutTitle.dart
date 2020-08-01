import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const cardColor = Color(0xFFF7C3B1);

class SmallOrangeCardWithoutTitle extends StatefulWidget {
  final String description;
  final int index;
  final List removingat;
  Widget Dialogue;
  final String CollectionName;
  final ID;

  SmallOrangeCardWithoutTitle(
      {this.description,
      this.index,
      this.removingat,
      this.Dialogue,
      this.CollectionName,
      this.ID});

  @override
  _SmallOrangeCardWithoutTitleState createState() =>
      _SmallOrangeCardWithoutTitleState();
}

bool erased;

class _SmallOrangeCardWithoutTitleState
    extends State<SmallOrangeCardWithoutTitle> {
  final _firestore = Firestore.instance;
  @override
  void initState() {
    erased = false;
    super.initState();
  }

  void _showDialog(CollectionName, ID) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Delete card?",
          ),
          content: new Text("This will remove the card permanently"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Delete",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                setState(() {
//                  erased = true;
//                  widget.removingat.removeAt(widget.index);
                  _firestore.collection(CollectionName).document(ID).delete();
                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text(
                "Head Back",
                style: TextStyle(
                    color: Color(
                  0XFFE95420,
                )),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                      ).then((_) => setState(() {}));
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDialog(widget.CollectionName, widget.ID);
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
