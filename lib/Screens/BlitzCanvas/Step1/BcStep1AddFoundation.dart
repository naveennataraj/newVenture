import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/AddFoudationalDeatil.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class Step1AddFoundation extends StatefulWidget {
  @override
  _Step1AddFoundationState createState() => _Step1AddFoundationState();
}

class _Step1AddFoundationState extends State<Step1AddFoundation> {
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
                      "Add details of the foundational aspects of the business",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),),

                  (foundationContent.length == 0)
                      ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Click on '+' to add the Product Goals",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                      :
                  ListView.builder(
                    itemCount: foundationContent.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: foundationContent != null
                            ? <Widget>[
                          SmallOrangeCardWithTitle(
                            title: foundationContent[index]
                                .title,
                            description:
                            foundationContent[index]
                                .description,
                            index: index,
                            removingat: foundationContent,
                            Dialogue: AddFoundationalDetail(
                              index: index,
                            ),
                          )
                        ]
                            : null,
                      );
                    },
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
                        CompleteStepButton(
                          OnTap: () {
                            bcStepsContent[0].bcCompletionValidator = true;
                            print(bcStepsContent[0].bcCompletionValidator);
                            Navigator.pushNamed(
                                context, '/BCHomeView');
                          },
                        ),
//                        goNextButton(
//                          OnTap: () {
////                            bcpData[0].CompletionValidator = false;
////                            print(bcpData[0].CompletionValidator);
//                            Navigator.pushNamed(context, '/BCStep7IntellectualAssets');
//                          },
//                          //routeName: '/BCStep3WireFrameLink',
//                          // write here
//                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(100),
        child: FloatingActionButton(
          tooltip: "Add's New Card",
          backgroundColor: Color(0XFFE95420),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AddFoundationalDetail(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}



