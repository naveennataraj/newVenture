import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/BcUniqueSellingProposition.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "Solution", route: '/BifCanvasSolution'),
];

class BifCanvasSolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcUniqueSellingProposition(
      breads: breads, headBackRoute: '/BIFCanvasFramework', goNextRoute: '/BifCanvasTouchPoint',
    );
  }
}
