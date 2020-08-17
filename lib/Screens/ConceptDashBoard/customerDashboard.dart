import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'conceptDashboardNavigationBloc.dart';

class customerDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _customerDashBoardState createState() => _customerDashBoardState();
}

class _customerDashBoardState extends State<customerDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'Who are our customers?',
          cardNote:
              'Urban dwellers who are employed and aged between 18 and 34 years . Solution is aimed at Both Enterprise and Consumer market segment(s).',
          cardButtonName: 'VIEW PERSONA',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'Customer Pain Point (Primary)',
          cardNote:
              'The customer tends to have too many tasks to manage. There is no system in place to help them manage their tasks efficiently, at the moment.',
          cardButtonName: 'EXPLORE OTHER PAIN POINTS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'Needs of our user(s)',
          cardNote:
              '"As a casual user, I want to add a task in the least amount of steps possible so that I can collect all tasks to be managed in a single location"',
          cardButtonName: 'VIEW OTHER USER STORIES',
          onTap: () {},
        ),
      ],
    );
  }
}
