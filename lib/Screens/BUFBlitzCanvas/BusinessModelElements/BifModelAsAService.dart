import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcModelService.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "Business Model Elements ", route: '/BIFElements'),
  Bread(label: "Intellectual Assets", route: '/BIFIntellectualAssets'),
  Bread(label: "'As a service' offerings", route: '/BIFServiceOffering'),
];

class BifAsaServiceOffering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcModelAsAService(
      breads: breads, completeButtonRoute: '/BIFCanvasFramework',
    );
  }
}
