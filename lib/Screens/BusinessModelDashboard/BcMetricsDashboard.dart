import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcMetricsDashboard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcMetricsDashboard(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});

  @override
  _BcMetricsDashboardState createState() => _BcMetricsDashboardState();
}

class _BcMetricsDashboardState extends State<BcMetricsDashboard> {
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
      dashboardTitle: 'Metrics, which will help keep us on track:',
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
