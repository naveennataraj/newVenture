import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Widgets/FloatingButton.dart';




class Step1AddFoundation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView.builder(
          itemCount: foundationContent.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10.0),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                //CardRectangleLarge(subjects[index]),
                SmallOrangeCard(foundationContent[index]),

              ],
            );
          },)

      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
