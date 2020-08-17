import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'conceptDashboardNavigationBloc.dart';

class solutionDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _solutionDashBoardState createState() => _solutionDashBoardState();
}

class _solutionDashBoardState extends State<solutionDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Our Solution',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'What we learnt from our competition',
          cardNote:
              'Our competitor Todoist, offers features such as backup tasks to the cloud, labeling of tasks, smart schedule of tasks.',
          cardButtonName: 'REVIEW OTHER COMPETITORS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'List of planned features (for the solution)',
          cardNote:
              'For the initial release, we plan to include the following features: Export tasks to csv , Filter based on priority',
          cardButtonName: 'VIEW ALL FEATURES',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.attach_money,
          cardTitle: 'How we make money',
          cardNote:
              'We plan to monetize this innovation via advertising. This strategy will be integrated into the early desings of the solution.',
          onTap: () {},
        ),
      ],
    );
  }
}
