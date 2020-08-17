import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'conceptDashboardNavigationBloc.dart';

class nextStepsDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _nextStepsDashBoardState createState() => _nextStepsDashBoardState();
}

class _nextStepsDashBoardState extends State<nextStepsDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Planning the next steps...',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'Problem-Solution fit review',
          cardNote:
              'The Customer problem always keeps evolving. We need to check back for relevance of problem-solution fit. The date for the next review is : 2nd Jun 2020',
          cardButtonName: 'RESCHEDULE',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'Parallel Products',
          cardNote:
              'At present, we can think of this additional product concept which can one of the we can think of these parallel innovations which can be of value to our customer base: \n Calendar Sync - Syncs ToDo items with a calendar and allows for meeting scheduling and meeting notes',
          cardButtonName: 'REVIEW MORE SUCH SOLUTIONS',
          onTap: () {},
        ),
      ],
    );
  }
}
