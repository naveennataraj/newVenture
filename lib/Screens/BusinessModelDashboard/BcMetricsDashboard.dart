import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcMetricsDashboard extends StatefulWidget with ConceptDashboardStates {
  @override
  _BcMetricsDashboardState createState() => _BcMetricsDashboardState();
}

class _BcMetricsDashboardState extends State<BcMetricsDashboard> {
  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.star,
          cardTitle: 'North Star metric',
          cardNote:
          'Ratio of tasks registered to tasks completed',
          cardButtonName: 'VIEW OTHER METRICS',
          onTap: () {},
        ),
      ],
    );
  }
}
