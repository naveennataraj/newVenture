import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addProductFeaturesDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddProductFeatures extends StatefulWidget {
  @override
  _AddProductFeaturesState createState() => _AddProductFeaturesState();
}

class _AddProductFeaturesState extends State<AddProductFeatures> {
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
                      "Let's list out the Product Features for the solution concept",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  (AddingNewProductFeature.length == 0)
                      ? Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Click on '+' to add the Product Features",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: AddingNewProductFeature.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: AddingNewProductFeature != null
                                  ? <Widget>[
                                      SmallOrangeCardWithTitle(
                                        title: AddingNewProductFeature[index]
                                            .FeatureTitle,
                                        description:
                                            AddingNewProductFeature[index]
                                                .FeatureDescription,
                                        index: index,
                                        removingat: AddingNewProductFeature,
                                        Dialogue: addProductFeaturesDialogue(
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
                        goNextButton(
                          routeName: '/currentmarketplayers',
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
              builder: (BuildContext context) => addProductFeaturesDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
