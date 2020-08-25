import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcMoneyDashboard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcMoneyDashboard(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});

  @override
  _BcMoneyDashboardState createState() => _BcMoneyDashboardState();
}

class _BcMoneyDashboardState extends State<BcMoneyDashboard>  {
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
      dashboardTitle: 'How we make money and manage capital:',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.attach_money,
          cardTitle: 'How we make money.',
          cardNote:
          'We plan to monetize this innovation via advertising. This strategy will be integrated into the early desings of the solution.',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.folder_special,
          cardTitle: 'IP Properties',
          cardNote:
          'The code behind the application will be protected by means of Copyright',
          cardButtonName: 'VIEW ALL IP PROPERTIES',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.rate_review,
          cardTitle:
          'How we handle Growth',
          cardNote:
          'I intend to use a cloud service provider such as AWS, Firebase or Azure.',
          onTap: () {},
        ),
      ],
    );
  }
}
