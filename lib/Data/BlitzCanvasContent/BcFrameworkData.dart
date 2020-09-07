import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BcFrameworkContent {
  final IconData frameWorkIcon;
  final String frameworkStep;
  final String frameWorkDescription;
  final String buttonText;
  final String navigateTo;
  bool bcCompletionValidator;
  final ID;
  final index;

  BcFrameworkContent(
      { this.frameWorkIcon,
        this.frameworkStep,
        this.frameWorkDescription,
        this.buttonText,
        this.navigateTo,
        this.bcCompletionValidator,
        this.ID,
        //this.bifModel,
      this.index});
}

List<BcFrameworkContent> bcStepsContent = [
  BcFrameworkContent(
    frameworkStep: ' - Build the Foundation',
    frameWorkIcon: Icons.build,
    frameWorkDescription:
    'Defining the organization\'s mission, vision and other foudational elements.',
    buttonText: "LET'S GET STARTED",
    navigateTo:  '/BCStep1CollectAspects',

  ),
  BcFrameworkContent(
    frameworkStep: ' - Studying the user',
    frameWorkIcon: Icons.person,
    frameWorkDescription:
    'Studying the user, who they are and understanding their pain points.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep2UserProfile',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Defining the solution',
    frameWorkIcon: Icons.mouse,
    frameWorkDescription:
    'Defining product goals, the features of the product and Creating a solution outline.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep3Goals',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Unique selling proposition',
    frameWorkIcon: Icons.important_devices,
    frameWorkDescription:
    'Highlighting what makes the solution unique and the customer touchpoints in focus.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep4SellingProposition',

  ),
  BcFrameworkContent(
    frameworkStep: ' - The User\'s feedback',
    frameWorkIcon: Icons.feedback,
    frameWorkDescription:
    "Capturing the user's initial thoughts after they have tried out the solution.",
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep5CustomersQuotes',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Studying the competition',
    frameWorkIcon: Icons.supervised_user_circle,
    frameWorkDescription:
    "Studying the current market players and the solutions/features they offer.",
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep6CompetingProduct',

  ),
  BcFrameworkContent(
    frameworkStep: ' - Business model elements',
    frameWorkIcon: Icons.pie_chart,
    frameWorkDescription:
    'Define the business model elements, the IP and the services used.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep7BusinessModelElements',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Synergies',
    frameWorkIcon: Icons.compare_arrows,
    frameWorkDescription:
    'Spot potential synergies between different parts of the business model.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep8Synergies',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Managing Growth',
    frameWorkIcon: Icons.trending_up,
    frameWorkDescription:
    'Outlining how the business intends to scale with growth and plan parallel products.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep9Growth',
  ),
  BcFrameworkContent(
    frameworkStep: ' - Metrics',
    frameWorkIcon: Icons.track_changes,
    frameWorkDescription:
    'List out the metrics which will be used to keep track of the business.',
    buttonText: 'Begin Step ',
    navigateTo: '/BCStep10MetricSection1',
  ),
];
// BUF BLITZ CANVAS Small Blitz Canvas Framework
List<BcFrameworkContent> bifCanvasContent = [
  BcFrameworkContent(
    frameworkStep: 'Step 1 - Build the Foundation',
    frameWorkIcon: Icons.build,
    frameWorkDescription:
    'Defining the organization\'s mission, vision and other foudational elements.',
    buttonText: "LET'S GET STARTED",
    navigateTo: '/BIFCanvas',

  ),
  BcFrameworkContent(
    frameworkStep: 'Step 2 - Defining the solution',
    frameWorkIcon: Icons.mouse,
    frameWorkDescription:
    'Defining product goals, the features of the product and Creating a solution outline.',
    buttonText: 'Begin Step 2',
    navigateTo: '/BIFCanvasWireframe',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 3 - Unique selling proposition',
    frameWorkIcon: Icons.important_devices,
    frameWorkDescription:
    'Highlighting what makes the solution unique and the customer touchpoints in focus.',
    buttonText: 'Begin Step 3',
    navigateTo: '/BifCanvasSolution',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 4 - Business model elements',
    frameWorkIcon: Icons.pie_chart,
    frameWorkDescription:
    'Define the business model elements, the IP and the services used.',
    buttonText: 'Begin Step 4',
    navigateTo: '/BIFElements',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 5 - Synergies',
    frameWorkIcon: Icons.compare_arrows,
    frameWorkDescription:
    'Spot potential synergies between different parts of the business model.',
    buttonText: 'Begin Step 5',
    navigateTo: '/BIFSynergies',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 6 - Metrics',
    frameWorkIcon: Icons.track_changes,
    frameWorkDescription:
    'List out the metrics which will be used to keep track of the business.',
    buttonText: 'Begin Step 6',
    navigateTo: '/BIFStarMetric',
  ),
];
