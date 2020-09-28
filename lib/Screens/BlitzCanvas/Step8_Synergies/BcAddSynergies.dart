import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcSynergies.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Synergies", route: '/BCStep8Synergies'),
];


class BcAddSynergies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcSynergies(breads: breads, headBackRoute: '/BCHomeView', completeButtonRoute: '/BCHomeView');
  }
}
