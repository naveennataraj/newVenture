import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BcFrameworkContent {
  final int id;
  final IconData frameWorkIcon;
  final String frameworkStep;
  final String frameWorkDescription;
  final String buttonText;
  final String navigateTo;


  BcFrameworkContent(
      { this.id, this.frameWorkIcon,
        this.frameworkStep,
        this.frameWorkDescription,
        this.buttonText,
        this.navigateTo});
}

List<BcFrameworkContent> bcStepsContent = [
  BcFrameworkContent(
    id: 1,
    frameworkStep: 'Step 1 - Build the Foundation',
    frameWorkIcon: Icons.build,
    frameWorkDescription:
    'Defining the organization\'s mission, vision and other foudational elements.',
    buttonText: "LET'S GET STARTED",
    navigateTo: '/BCStep1CollectAspects',
  ),
  BcFrameworkContent(
    id:2,
    frameworkStep: 'Step 2 - Studying the user',
    frameWorkIcon: Icons.person,
    frameWorkDescription:
    'Studying the user, who they are and understanding their pain points.',
    buttonText: 'Begin Step 2',
    navigateTo: '/BCStep2UserProfile',
  ),
  BcFrameworkContent(
    id:3,
    frameworkStep: 'Step 3 - Defining the solution',
    frameWorkIcon: Icons.mouse,
    frameWorkDescription:
    'Defining product goals, the features of the product and Creating a solution outline.',
    buttonText: 'Begin Step 3',
    navigateTo: '/BCStep3Goals',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 4 - Unique selling proposition',
    frameWorkIcon: Icons.important_devices,
    frameWorkDescription:
    'Highlighting what makes the solution unique and the customer touchpoints in focus.',
    buttonText: 'Begin Step 4',
    navigateTo: '/BCStep4SellingProposition',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 5 - The User\'s feedback',
    frameWorkIcon: Icons.feedback,
    frameWorkDescription:
    "Capturing the user's initial thoughts after they have tried out the solution.",
    buttonText: 'Begin Step 5',
    navigateTo: '/BCStep5CustomersQuotes',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 6 - Studying the competition',
    frameWorkIcon: Icons.supervised_user_circle,
    frameWorkDescription:
    "Studying the current market players and the solutions/features they offer.",
    buttonText: 'Begin Step 6',
    navigateTo: '/BCStep6CompetingProduct',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 7 - Business model elements',
    frameWorkIcon: Icons.pie_chart,
    frameWorkDescription:
    'Define the business model elements, the IP and the services used.',
    buttonText: 'Begin Step 7',
    navigateTo: '/BCStep7BusinessModelElements',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 8 - Synergies',
    frameWorkIcon: Icons.compare_arrows,
    frameWorkDescription:
    'Spot potential synergies between different parts of the business model.',
    buttonText: 'Begin Step 8',
    navigateTo: '/BCStep8Synergies',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 9 - Managing Growth',
    frameWorkIcon: Icons.trending_up,
    frameWorkDescription:
    'Outlining how the business intends to scale with growth and plan parallel products.',
    buttonText: 'Begin Step 9',
    navigateTo: '/Problemstudy',
  ),
  BcFrameworkContent(
    frameworkStep: 'Step 10 - Metrics',
    frameWorkIcon: Icons.track_changes,
    frameWorkDescription:
    'List out the metrics which will be used to keep track of the business.',
    buttonText: 'Begin Step 10',
    navigateTo: '/Problemstudy',
  ),
];
