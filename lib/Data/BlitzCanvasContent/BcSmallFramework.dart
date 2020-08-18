import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BcSmallFrameworkContent {
  final IconData frameWorkIcon;
  final String frameworkStep;
  final String frameWorkDescription;
  final String buttonText;
  final String navigateTo;
  bool bcCompletionValidator;
  final ID;
  final index;

  BcSmallFrameworkContent(
      { this.frameWorkIcon,
        this.frameworkStep,
        this.frameWorkDescription,
        this.buttonText,
        this.navigateTo,
        this.bcCompletionValidator,
        this.ID,
        this.index});
}

List<BcSmallFrameworkContent> bcStepsContent = [
  BcSmallFrameworkContent(
    frameworkStep: 'Step 1 - Build the Foundation',
    frameWorkIcon: Icons.build,
    frameWorkDescription:
    'Defining the organization\'s mission, vision and other foudational elements.',
    buttonText: "LET'S GET STARTED",
    navigateTo: '/BCStep1CollectAspects',
  ),
  BcSmallFrameworkContent(
    frameworkStep: 'Step 2 - Defining the solution',
    frameWorkIcon: Icons.mouse,
    frameWorkDescription:
    'Defining product goals, the features of the product and Creating a solution outline.',
    buttonText: 'Begin Step 2',
    navigateTo: '/BCStep3Goals',
  ),
  BcSmallFrameworkContent(
    frameworkStep: 'Step 3 - Unique selling proposition',
    frameWorkIcon: Icons.important_devices,
    frameWorkDescription:
    'Highlighting what makes the solution unique and the customer touchpoints in focus.',
    buttonText: 'Begin Step 3',
    navigateTo: '/BCStep4SellingProposition',
  ),
  BcSmallFrameworkContent(
    frameworkStep: 'Step 4 - Business model elements',
    frameWorkIcon: Icons.pie_chart,
    frameWorkDescription:
    'Define the business model elements, the IP and the services used.',
    buttonText: 'Begin Step 4',
    navigateTo: '/BCStep7BusinessModelElements',
  ),
  BcSmallFrameworkContent(
    frameworkStep: 'Step 5 - Synergies',
    frameWorkIcon: Icons.compare_arrows,
    frameWorkDescription:
    'Spot potential synergies between different parts of the business model.',
    buttonText: 'Begin Step 5',
    navigateTo: '/BCStep8Synergies',
  ),
  BcSmallFrameworkContent(
    frameworkStep: 'Step 6 - Metrics',
    frameWorkIcon: Icons.track_changes,
    frameWorkDescription:
    'List out the metrics which will be used to keep track of the business.',
    buttonText: 'Begin Step 6',
    navigateTo: '/BCStep10MetricSection1',
  ),
];
