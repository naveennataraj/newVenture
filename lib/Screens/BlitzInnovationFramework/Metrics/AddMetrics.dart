import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/Metrics/addMetrics.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/Metrics/addMetricsDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddMetrics extends StatefulWidget {
  @override
  _AddMetricsState createState() => _AddMetricsState();
}

class _AddMetricsState extends State<AddMetrics> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      AddingNewMetrics;
      print(AddingNewMetrics);
    });
  }

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
                      "Add additional metrics (optional)",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        'Tip: Metrics help measure and keep track of what is important in the solution concept and business model.\nThe framework for capture of metrics used by this application is based on the MESOPS Framework. To study this further, please refer to this link.',
                  ),
                  (AddingNewMetrics.length == 0)
                      ? Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Click on '+' to add the solution concept",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: AddingNewMetrics.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: AddingNewMetrics != null
                                  ? <Widget>[
                                      SmallOrangeCardWithTitle(
                                        title: AddingNewMetrics[index].Name,
                                        description:
                                            AddingNewMetrics[index].Description,
                                        index: index,
                                        removingat: AddingNewMetrics,
                                        Dialogue: addMetricsDialogue(
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
                            bcpData[7].CompletionValidator = true;

                            Navigator.pushNamed(
                                context, '/BlitzInnovationFramework');
                          },
                        ),
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
              builder: (BuildContext context) => addMetricsDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
