import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentNorthStarMetric.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/MetricDashoard/MetricDialogue.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcAddMoreMetrics.dart';

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
  final _firestore = Firestore.instance;
  //======= North Star Metric =======
  String northStarString = '';

  void initState() {
    super.initState();
    getDocuments();
  }

  void getDocuments() async {
    //======= North Star Metric =======
    final documentIpProperties =
        await _firestore.collection(currentUser).document('Bc10_metrics').get();
    if (documentIpProperties.exists) {
      collectionNorthStarMetric = [];
      final metricSectionOneText =
          documentIpProperties.data['metricSectionOne'];
      //final ID = documentIpProperties.documentID;

      final fields = ContentNorthStarMetric(
        northStarMetric: metricSectionOneText,
      );
      collectionNorthStarMetric.insert(0, fields);

      setState(() {
        (collectionNorthStarMetric.length != 0)
            ? northStarString = collectionNorthStarMetric[0].northStarMetric
            : northStarString = 'Missing ';
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
      dashboardTitle: 'Metrics, which will help keep us on track:',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.star,
            cardTitle: 'North Star metric',
            cardNote: '$northStarString',
            cardButtonName: 'VIEW OTHER METRICS',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BcAddMoreMetrics(fromDashboard: true,),
                  ));
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => NorthMetricDialogue(
                  dashboardCard: northStarString,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
