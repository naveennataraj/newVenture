import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcModelIntellectualProperties.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Model Elements ", route: '/BCStep7BusinessModelElements'),
  Bread(label: "Intellectual Assets", route: '/BCStep7IntellectualAssets'),
];

class BcIntellectualPropertyAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcModelIntellectualProperties(
        breads: breads, goNextRoute: '/BCStep7ServiceOffering'
    );
  }
}

