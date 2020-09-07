import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/AddFoudationalDeatil.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:iventure001/Widgets/ValidationDialogue.dart';
import 'package:iventure001/Widgets/BcAFoundationalAspectsAdd.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
  Bread(label: "Foundational Aspects", route: '/BIFCanvas'),
  Bread(label: "Aspects of the business", route: '/BIFCanvasFoundationAspectAdd'),
];

class BifCanvasAddFoundationAspects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcAddFoundationalAspects(
      breads: breads,
      completeButtonRoute: '/BIFCanvasFramework',
    );
  }
}
