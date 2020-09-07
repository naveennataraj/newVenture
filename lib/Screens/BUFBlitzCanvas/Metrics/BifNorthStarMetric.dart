import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcNorthStarMetric.dart';
List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "North Star Metric", route: '/BIFStarMetric'),
];

class BifNorthMetric extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcNorthStarMetric(breads: breads, headBackRoute:'/BIFCanvasFramework', goNextRoute: '/BIFAddmetrics',
        titleCard:"Let's list the single most important metric for your business", dotsCount:2, dotPosition: 0,
    buttonName: 'GO NEXT',);
  }
}
