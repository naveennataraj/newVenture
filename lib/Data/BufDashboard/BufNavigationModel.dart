import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';

class NavigationModel {
  final String title;
  final IconData icon;
  final BufDashboardEvents event;

  NavigationModel({this.title, this.icon, this.event});
}

List<NavigationModel> navigationItems = [
  NavigationModel(
      title: 'Overview',
      icon: Icons.dashboard,
      event: BufDashboardEvents.overviewClicked),
  NavigationModel(
      title: 'Customer',
      icon: Icons.people,
      event: BufDashboardEvents.customerClicked),
  NavigationModel(
      title: 'Solution',
      icon: Icons.insert_emoticon,
      event: BufDashboardEvents.solutionClicked),
  NavigationModel(
      title: 'Product',
      icon: Icons.label_important,
      event: BufDashboardEvents.productClicked),
  NavigationModel(
      title: 'Strategy',
      icon: Icons.sync,
      event: BufDashboardEvents.strategyClicked),
  NavigationModel(
      title: 'Feedback',
      icon: Icons.feedback,
      event: BufDashboardEvents.feedbackClicked),
  NavigationModel(
      title: 'Money',
      icon: Icons.monetization_on,
      event: BufDashboardEvents.moneyClicked),
  NavigationModel(
      title: 'Metrics',
      icon: Icons.timelapse,
      event: BufDashboardEvents.metricsClicked),
  NavigationModel(
      title: 'Next Steps',
      icon: Icons.timeline,
      event: BufDashboardEvents.nextStepsClicked),
];
