import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcModelService.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Model Elements ", route: '/BCStep7BusinessModelElements'),
  Bread(label: "Intellectual Assets", route: '/BCStep7IntellectualAssets'),
  Bread(label: "'As a service' offerings", route: '/BIFServiceOffering'),
];


class BcAsaServiceOffering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcModelAsAService(
      breads: breads, completeButtonRoute: '/BCHomeView',
    );
  }
}
