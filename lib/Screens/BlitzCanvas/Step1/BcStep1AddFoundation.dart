import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/AddFoudationalDeatil.dart';
import 'package:iventure001/Screens/BlitzCanvas/menuScreen.dart';
import 'package:iventure001/Widgets/FloatingButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCard.dart';

class Step1AddFoundation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height * .40,
          margin: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width * .40,
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
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Add details of the foundational aspects of the business',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  ListView.builder(
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
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(
                      Icons.add,
                      size: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        CompleteStepButton(),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddFoundationalDetail(),
          );
        },
      ),
    );
  }
}

class CompleteStepButton extends StatelessWidget {
  const CompleteStepButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, '/BCHomeView');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BCScreen(
              completeStep1: 1,
              stepsList: [1],
            ),
          ),
        );
      },
      child: Text(
        'COMPLETE STEP',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
