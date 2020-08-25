import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/AsAServiceDialogue.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';

class BcMarketStrategy extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcMarketStrategy(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});

  @override
  _BcMarketStrategyState createState() => _BcMarketStrategyState();
}

class _BcMarketStrategyState extends State<BcMarketStrategy> {
  final _firestore = Firestore.instance;
 //======= As a service Offering =======
  String asAService= '';
  String asAServiceDescription= '';

  void initState() {
    super.initState();
    getDocuments();
  }

  void getDocuments() async {

    //======= As a service Offering =======
    final documentAddService = await _firestore
        .collection('$currentUser/Bc7_businessModelElements/addServices')
        .getDocuments();
    if (documentAddService != null) {

      addingAsaService = [];
      for (var message in documentAddService.documents) {
        final serviceName = message.data['serviceName'];
        final serviceDescription =
        message.data['serviceDescription'];
        final serviceType = message.data['serviceType'];
        final parentCompany = message.data['parentCompany'];
        final serviceTaskDescription = message.data['serviceTaskDescription'];
        final servicePercentage = message.data['servicePercentage'];

        final ID = message.documentID;

        final card = AddAsaServiceOffering(
          serviceName: serviceName,
          serviceDescription: serviceDescription,
          serviceType: serviceType,
          parentCompany: parentCompany,
          serviceTaskDescription: serviceTaskDescription,
          servicePercentage: servicePercentage,
          ID: ID,
        );
        addingAsaService.add(card);
      }
      setState(() {

        if(addingAsaService.length !=0) {
          asAService= addingAsaService[0].serviceName;
          asAServiceDescription= addingAsaService[0].serviceTaskDescription;
        } else {asAService= 'Missing value';}
      });
    }

  }





  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      sizedboxwidth:
      (widget.sizedboxwidth != null) ? widget.sizedboxwidth : 100,
      headingAlignment: (widget.headingAlignment != null)
          ? widget.headingAlignment
          : CrossAxisAlignment.center,
      headingStyle: (widget.headingStyle != null)
          ? widget.headingStyle
          : topHeadingTextStyle,
      sizedboxheight:
      (widget.sizedboxheight != null) ? widget.sizedboxheight : 50,
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'How we reduce rework',
          cardNote:
              'We intend to use $asAService for the purpose of $asAServiceDescription',
          cardButtonName: 'VIEW SERVICES AND FRAMEWORKS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'How we Synergize',
          cardNote:
              '"A key resource (developer/designer) working with tech support personnel to create a new feature called \'task clipper\', based on studying user feedback. "',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.face,
          cardTitle: 'What we learnt about our target customer',
          cardNote:
              'Urban dwellers who are employed and aged between 18 and 34 years . Solution is aimed at Both Enterprise and Consumer market segment(s).',
          cardButtonName: 'VIEW PERSONA',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.leak_add,
          cardTitle: 'What we learnt from our competition',
          cardNote:
              'Our competitor Todoist, offers features such as backup tasks to the cloud, labeling of tasks, smart schedule of tasks',
          cardButtonName: 'REVIEW OTHER COMPETITORS',
          onTap: () {},
        ),
      ],
    );
  }
}
