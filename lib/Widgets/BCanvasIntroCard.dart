import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/SpaceHeight30.dart';
import 'package:iventure001/Widgets/SpaceHeight20.dart';

class BCanvasIntroCard extends StatelessWidget {

  final ContentFrameworkMenu bcMenuContent;
  BCanvasIntroCard(this.bcMenuContent);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .40,
        width: MediaQuery.of(context).size.width * .50,
        decoration: BoxDecoration(
          color: Colors.white,
          //shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                bcMenuContent.title,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Space20(),
              Text(
                bcMenuContent.paragraph1,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Space20(),
              Text(
                bcMenuContent.paragraph2,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,

              ),
              Space20(),
              Text(
                bcMenuContent.paragraph3,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Space30(),
            ],
          ),
        ),
      ),
    );
  }
}
