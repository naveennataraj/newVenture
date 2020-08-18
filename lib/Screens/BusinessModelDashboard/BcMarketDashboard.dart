import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcMarketStrategy extends StatefulWidget with ConceptDashboardStates {
  @override
  _BcMarketStrategyState createState() => _BcMarketStrategyState();
}

class _BcMarketStrategyState extends State<BcMarketStrategy> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.work_off,
          cardTitle: 'How we reduce rework',
          cardNote:
          'We intend to use Google Apps suite for the purpose of Collaboration when working on joint tasks.',
          cardButtonName: 'VIEW SERVICES AND FRAMEWORKS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.flip_camera_android_rounded,
          cardTitle:
          'How we Synergize',
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
