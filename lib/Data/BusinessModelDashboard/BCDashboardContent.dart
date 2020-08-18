import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BcNavigationModel {
  final String title;
  final IconData icon;
  final ConceptDashboardEvents event;

  BcNavigationModel({this.title, this.icon, this.event});
}

List<BcNavigationModel> navigationItems = [
  BcNavigationModel(
      title: 'Overview',
      icon: Icons.dashboard,
      event: ConceptDashboardEvents.overviewClicked),
  BcNavigationModel(
      title: 'Customer',
      icon: Icons.people,
      event: ConceptDashboardEvents.customerClicked),
  BcNavigationModel(
      title: 'Strategy',
      icon: Icons.sync,
      event: ConceptDashboardEvents.strategyClicked),
  BcNavigationModel(
      title: 'Money',
      icon: Icons.monetization_on,
      event: ConceptDashboardEvents.moneyClicked),
  BcNavigationModel(
      title: 'Metrics',
      icon: Icons.timeline,
      event: ConceptDashboardEvents.metricsClicked),
];
