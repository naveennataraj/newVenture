import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcMetricDialogue.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcAddMetrics extends StatefulWidget {
  final String headBackRoute;
  BcAddMetrics({this.headBackRoute});

  @override
  _BcAddMetricsState createState() => _BcAddMetricsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Section 1", route: '/BCStep10MetricSection1'),
  Bread(label: "Section 2", route: '/BCStep10MetricSection2'),
  Bread(label: "More Metrics", route: '/BCStep10AddMoreMetrics'),
];


class _BcAddMetricsState extends State<BcAddMetrics> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
