import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcUniqueTouchPoints.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "Solution", route: '/BifCanvasSolution'),
  Bread(label: "Customer Touchpoints", route: '/BifTouchPoints'),
];

class BifTouchPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcTouchPoints(breads: breads, completeButtonRoute: '/BIFCanvasFramework',);
  }
}
