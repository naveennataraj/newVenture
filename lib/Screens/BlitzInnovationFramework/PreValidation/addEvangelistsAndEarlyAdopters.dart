import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addContact.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addEvangelistsAndEarlyAdoptersDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddEvangelistsAndEarlyAdopters extends StatefulWidget {
  @override
  _AddEvangelistsAndEarlyAdoptersState createState() =>
      _AddEvangelistsAndEarlyAdoptersState();
}

class _AddEvangelistsAndEarlyAdoptersState
    extends State<AddEvangelistsAndEarlyAdopters> {
  NotifyProgress() {
    setState(() {
      bcpData[4].CompletionValidator = false;
      print(bcpData[4].CompletionValidator);
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
                      "Add the contact list, with whom the product wireframe will need to be shared (for validation)",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        'Tip: Add the contact details of the evangelists and early adopters with whom the wireframe will be shared.',
                  ),
                  (AddingNewContacts.length == 0)
                      ? Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Click on '+' to add the Quote",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: AddingNewContacts.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: AddingNewContacts != null
                                  ? <Widget>[
                                      SmallOrangeCardWithTitle(
                                        title: AddingNewContacts[index].Name,
                                        description:
                                            AddingNewContacts[index].Email,
                                        index: index,
                                        removingat: AddingNewContacts,
                                        Dialogue:
                                            addEvangelistsAndEarlyAdoptersDialogue(
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
                          StepValidator: NotifyProgress(),
                          routeName: '/adddistributionmedium',
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
              builder: (BuildContext context) =>
                  addEvangelistsAndEarlyAdoptersDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
