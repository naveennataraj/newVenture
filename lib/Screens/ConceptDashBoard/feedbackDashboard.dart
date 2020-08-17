import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'conceptDashboardNavigationBloc.dart';

class feedbackDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _feedbackDashBoardState createState() => _feedbackDashBoardState();
}

class _feedbackDashBoardState extends State<feedbackDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'When the customers interacted with our solution',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'The customer problem is resolved.',
          cardNote:
              'When task management and personal planning is done through a streamlined system and task completion rate per month improves by 20%.',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'How we intend to deliver the solution',
          cardNote:
              'We plan to distribute our product via: The web, as our primary medium.',
          cardButtonName: 'CHANGE DISTRIBUTION MEDIUM',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.attach_money,
          cardTitle: 'Customer Quotes (on using the solution prototype)',
          cardNote:
              '"When I need to remember a task, I type it in. When I am done, I strike it out. It is that simple."',
          cardButtonName: 'VIEW MORE QUOTES',
          onTap: () {},
        ),
      ],
    );
  }
}
