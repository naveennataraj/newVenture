import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/BcWireframeLink.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/BcHighFidelityWireframe.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "Wireframe", route: '/BIFCanvasWireframe'),
];

class BifHighFidelityWireframe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcHighFidelityWireframe(
      breads: breads, goNextRoute: '/BIFCanvasFramework', dotsCount: 1, intPosition: 0,
    );
  }
}
