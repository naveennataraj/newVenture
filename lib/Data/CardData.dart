import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bifCardData {
  final IconData frameworkicon;
  final String frameworkStep;
  final String frameworkdescrip;
  final String buttonText;
  final String navigateTo;
  bool CompletionValidator;

  bifCardData(
      {this.CompletionValidator,
      this.frameworkicon,
      this.frameworkStep,
      this.frameworkdescrip,
      this.buttonText,
      this.navigateTo});
}

List<bifCardData> bcpData = [
  bifCardData(
    frameworkStep: 'Step 1 - Study the problem',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'Studying the problem space and understanding the pain points involved.',
    buttonText: "Let's Get Started",
    navigateTo: '/Problemstudy',
  ),
  bifCardData(
    frameworkStep: 'Step 2 - Studying the user',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'Studying the user, who they are, their environment and what they want.',
    buttonText: 'Begin Step 2',
    navigateTo: '/Adduserpersona',
  ),
  bifCardData(
    frameworkStep: 'Step 3 - Ideate and Conceptualize',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'Brainstorming possible solutions and selecting the best option.',
    buttonText: 'Begin Step 3',
    navigateTo: '/solutionideation',
  ),
  bifCardData(
    frameworkStep: 'Step 4 - Solution formulation',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'Defining product goals, the features of the product and Creating a solution outline.',
    buttonText: 'Begin Step 4',
    navigateTo: '/addproductgoals',
  ),
  bifCardData(
    frameworkStep: 'Step 5 - Pre-Validation',
    frameworkicon: Icons.book,
    frameworkdescrip:
        "Preparing for the collection of user's initial feedback on the solution concept.",
    buttonText: 'Begin Step 5',
    navigateTo: '/addevangelistsandearlyadopters',
  ),
  bifCardData(
    frameworkStep: 'Step 6 - Solution Validation',
    frameworkicon: Icons.book,
    frameworkdescrip:
        "Capturing the user's thoughts after they have tried out the solution and next steps.",
    buttonText: 'Begin Step 6',
    navigateTo: '/addquotes',
  ),
  bifCardData(
    frameworkStep: 'Step 7 - Managing growth',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'Outlining how the product plans to scale and planning for new parallel products.',
    buttonText: 'Begin Step 7',
    navigateTo: '/handlingscale',
  ),
  bifCardData(
    frameworkStep: 'Step 8 - Metrics',
    frameworkicon: Icons.book,
    frameworkdescrip:
        'List out the metrics which will be used to keep track of the product.',
    buttonText: 'Begin Step 8',
    navigateTo: '/addproductmetrics',
  ),
];
