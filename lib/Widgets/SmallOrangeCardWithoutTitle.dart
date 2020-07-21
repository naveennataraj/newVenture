import 'package:flutter/material.dart';

const cardColor = Color(0xFFF7C3B1);

class SmallOrangeCardWithoutTitle extends StatelessWidget {
  final String description;
  final int index;
  final List removingat;
  Widget Dialogue;
  SmallOrangeCardWithoutTitle(
      {this.description, this.index, this.removingat, this.Dialogue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, subject.pushView);
        print('working');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.20,
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
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            Flexible(
                child: SizedBox(
              height: 30,
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialogue,
                      );
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      removingat.removeAt(index);
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
