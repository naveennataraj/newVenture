import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/AsAServiceDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTittleDynamic.dart';
import 'package:iventure001/Widgets/CanvasCompleteStepButton.dart';

class BcAddSynergies extends StatefulWidget {
  @override
  _BcAddSynergiesState createState() => _BcAddSynergiesState();
}

class _BcAddSynergiesState extends State<BcAddSynergies> {
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
                      "List of 'As a service' offerings",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),),

                  (addingAsaService.length == 0)
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
                    itemCount: addingAsaService.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: addingAsaService != null
                            ? <Widget>[
                          SmallOrangeCardWithTitleDynamic(
                            title: addingAsaService[index]
                                .serviceName,
                            description:
                            addingAsaService[index]
                                .serviceTaskDescription,
                            index: index,
                            removingat: addingAsaService,
                            Dialogue: BcAsaServiceDialogue(
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
                        CompleteStepButton(),
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
              builder: (BuildContext context) => BcAsaServiceDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
