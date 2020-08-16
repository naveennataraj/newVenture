import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/ConceptDashBoard/conceptDashboardNavigationBloc.dart';

class NavigationModel {
  final String title;
  final IconData icon;
  final ConceptDashboardEvents event;

  NavigationModel({this.title, this.icon, this.event});
}

List<NavigationModel> navigationItems = [
  NavigationModel(
      title: 'Overview',
      icon: Icons.dashboard,
      event: ConceptDashboardEvents.overviewClicked),
  NavigationModel(
      title: 'Customer',
      icon: Icons.people,
      event: ConceptDashboardEvents.customerClicked),
  NavigationModel(
      title: 'Solution',
      icon: Icons.insert_emoticon,
      event: ConceptDashboardEvents.solutionClicked),
  NavigationModel(
      title: 'Feedback',
      icon: Icons.feedback,
      event: ConceptDashboardEvents.feedbackClicked),
  NavigationModel(
      title: 'Next Steps',
      icon: Icons.timeline,
      event: ConceptDashboardEvents.nextStepsClicked),
];
