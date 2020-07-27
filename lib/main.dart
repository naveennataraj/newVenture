import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addcompetingproducts.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addproductfeatures.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addproductgoals.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addwireframelink.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/ranksolutions.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/solutionideation.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/addstoriespainpoints.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/adduserenvironmentdetails.dart';
import 'package:iventure001/Screens/EditingScreen.dart';
import 'package:iventure001/bifdashboard.dart';

import 'Homepage.dart';
import 'Screens/BlitzInnovationFramework/BIFHomeScreen.dart';
import 'Screens/BlitzInnovationFramework/BlitzInnovationFramework.dart';
import 'Screens/BlitzInnovationFramework/StudyTheProblem/ProblemStudy.dart';
import 'Screens/BlitzInnovationFramework/StudyTheProblem/addpainpoints.dart';
import 'Screens/BlitzInnovationFramework/StudyingTheUser/adduserpersona.dart';

// Canvas
//Step1
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1AddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1CollectDetailsBusiness.dart';
import 'package:iventure001/Screens/BlitzCanvas/menuScreen.dart';
//Step2
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStep2CollectUserProfile.dart';
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStep2CapturingUserStories.dart';
//Step3
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/GoalsTheSolution.dart';

void main() {
  runApp(Vueapp());
}

class Vueapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
//      home: Homepage(),
      routes: {
        // Menu with 3 options
        '/': (context) => Homepage(),

        // BIF- BlitzInnovationFramework
        '/BIFHomeView': (context) => BIFHomeScreen(),
        '/BlitzInnovationFramework': (context) => BlitzInnovationFramework(),
        //Study The Problem
        '/Problemstudy': (context) => ProblemStudy(),
        '/addpainpoints': (context) => AddPainPoints(),
        //BIF Dashboard
        '/bifdashboard': (context) => bifdashboard(),
        '/editingScreen': (context) => Editingscreen(),
        //Studying the User
        '/Adduserpersona': (context) => AddUserPersona(),
        '/adduserenvironmentdetails': (context) => AddUserEnvironmentDetails(),
        '/addstoriespainpoints': (context) => AddStoriesPainPoints(),
        //Ideate and Conceptuallize
        '/solutionideation': (context) => SolutionIdeation(),
        '/ranksolutions': (context) => RankSolutions(),
        //Solution Formulation
        '/addproductgoals': (context) => AddProductGoals(),
        '/addproductfeatures': (context) => AddProductFeatures(),
        '/currentmarketplayers': (context) => AddCompetingProducts(),
        '/addwireframelink': (context) => AddWireframeLink(),

        // BC- BlitzCanvas
        '/BCHomeView': (context) => BCScreen(
              completeStep1: 11,
            ),
        //Step1 Build the Foundation
        '/BCStep1CollectAspects': (context) => BcStep1CollectionAspects(), //Mission and Vision statements
        '/BCStep1AddDetails': (context) => Step1AddFoundation(), //OrangeCards
        //Step2 Studying the user
        '/BCStep2UserProfile': (context) => BcStep2CollectUserProfile(),
        '/BCStep2CaptureUserStories': (context) => BcStep2CapturingUserStories(),
        //Step3 Defining the solution
        '/BCStep3Goals': (context) => Step3GoalsTheSolution(),
      },
    );
  }
}
