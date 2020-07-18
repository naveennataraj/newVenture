import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';

const cardColor = Color(0xFFF7C3B1);


class SmallOrangeCard extends StatelessWidget {
  final ContentBcAddFoundation addFoundationContent;
  SmallOrangeCard(this.addFoundationContent);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, subject.pushView);
        print('working');
      },
      child: Container(
        height: 180.0,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                addFoundationContent.title,
                //textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  //fontFamily: 'Raleway',
                  //fontWeight: FontWeight.bold,
                  //color: Colors.black,
                ),
              ),
            ),
            //SizedBox(height: 30.0),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(addFoundationContent.description, style: TextStyle(
                  fontSize: 15,),),
              ),
            ),
            //SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(bottom: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.delete),
                  SizedBox(width: 15.0,),
                  Icon(Icons.edit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
