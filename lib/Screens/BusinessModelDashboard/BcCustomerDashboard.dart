import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcCustomerDashboard extends StatefulWidget with ConceptDashboardStates {
  @override
  _BcCustomerDashboardState createState() => _BcCustomerDashboardState();
}

class _BcCustomerDashboardState extends State<BcCustomerDashboard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.new_releases,
          cardTitle: 'What is our Primary Value Proposition?',
          cardNote:
          'A simple Task management solution for personal and professional use, influenced by the Eisenhower method.',
          cardButtonName: 'VIEW WIREFRAME',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.call_split,
          cardTitle: 'How our solution stands out',
          cardNote:
          'Employment of the Eisenhower method to task management with an emphasis on the user experience',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle:
          'Customer Quotes (on using the solution prototype)',
          cardNote:
          'When I need to remember a task, I type it in. When I am done, I strike it out. It is that simple.',
          cardButtonName: 'VIEW MORE QUOTES',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.vpn_key,
          cardTitle: 'We excel at:',
          cardNote:
          'Developing models for prediction based on relevant data',
          cardButtonName: 'VIEW FOUNDATIONAL DETAILS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.trending_up,
          cardTitle:
          'Other offerings planned',
          cardNote:
          'Calendar Sync - Syncs ToDo items with a calendar and allows for meeting scheduling and meeting notes',
          cardButtonName: 'REVIEW MORE SUCH OFFERINGS',
          onTap: () {},
        )
      ],
    );
  }
}
