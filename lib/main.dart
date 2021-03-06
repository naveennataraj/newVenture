import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BUFBliztCanvasFramework.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BuildFoundation/BifFoundationAspects.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BuildFoundation/BifFoundationAspectsAdd.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BusinessModelElements/BifElements.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BusinessModelElements/BifIntellectualProperties.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BusinessModelElements/BifModelAsAService.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/DefiningSolution/BifHighFidelityWireframe.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/Metrics/BifAddmetrics.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/Metrics/BifNorthStarMetric.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/SellingProposition/Solution.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/SellingProposition/TouchPoints.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/Synergies/BifAddSynergies.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboard.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1AddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1CollectDetailsBusiness.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcAddMoreMetrics.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcMetricSection1.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcMetricSection2.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step4_CustomerTouchPoints/CustomerTouchPoint.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step4_CustomerTouchPoints/SolutionStandOut.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step5_CustomerQuotes/CustomerQuotes.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step6_StudyingTheCompetition/BcCompetingProducts.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcAddBusinessElements.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcAsAServiceOfferings.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcIntellectualProperties.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step8_Synergies/BcAddSynergies.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step9_ManagingGrowth/BcAddBusinessGrowth.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step9_ManagingGrowth/BcCreatingEcosystems.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/BcAddFidelityWireframes.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/FeaturesProduct.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/GoalsTheSolution.dart';
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStep2CapturingUserStories.dart';
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStep2CollectUserProfile.dart';
import 'package:iventure001/Screens/BlitzCanvas/menuScreen.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/ManagingGrowth/addParallelInnovations.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/ManagingGrowth/handlingscale.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/Metrics/AddProductMetrics.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addEvangelistsAndEarlyAdopters.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addcompetingproducts.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addproductfeatures.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addproductgoals.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addwireframelink.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/ranksolutions.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/solutionideation.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionValidation/addQuotes.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionValidation/reviewcustomerrequirements.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/addstoriespainpoints.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/adduserenvironmentdetails.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/ConceptDashboard.dart';
import 'package:iventure001/Screens/EditingScreen.dart';

import 'Constants/TextFieldConstants.dart';
import 'Screens/BlitzInnovationFramework/BIFHomeScreen.dart';
import 'Screens/BlitzInnovationFramework/BlitzInnovationFramework.dart';
import 'Screens/BlitzInnovationFramework/Metrics/AddMetrics.dart';
import 'Screens/BlitzInnovationFramework/StudyTheProblem/ProblemStudy.dart';
import 'Screens/BlitzInnovationFramework/StudyTheProblem/addpainpoints.dart';
import 'Screens/BlitzInnovationFramework/StudyingTheUser/adduserpersona.dart';
import 'Screens/Homepage.dart';
import 'Screens/login.dart';

void main() {
  runApp(Vueapp());
}

List<Bread> breads = [
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//  Bread(label: "Step 1- Foundational Aspects", route: '/BCStep1CollectAspects'),
//  Bread(label: "Step 1- Add Foundational Aspects", route: '/BCStep1AddDetails'),
//  Bread(label: "Step 2- Studying the user", route: '/BCStep1AddDetails'),
];

class Vueapp extends StatefulWidget {
  @override
  _VueappState createState() => _VueappState();
}

String LoggedUser;

class _VueappState extends State<Vueapp> {
  @override
  void initState() {
    super.initState();
    getCurrentUserMain();
    //getFirebaseUser();
  }

  void getCurrentUserMain() async {
    await FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user == null) {
      } else {
        getCurrentUser();
      }
    });
  }

  Future<FirebaseUser> getFirebaseUser() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    // Disable persistence on web platforms
    if (firebaseUser == null) {
      firebaseUser = await FirebaseAuth.instance.onAuthStateChanged.first;
      currentUser = firebaseUser.email;

      while (firebaseUser.email == null) {
        firebaseUser = await FirebaseAuth.instance.onAuthStateChanged.first;
        currentUser = firebaseUser.email;
      }

//      if(firebaseUser.email == null) {
//        firebaseUser = await FirebaseAuth.instance.onAuthStateChanged.first;
//      }

    } else {
      setState(() {
        currentUser = firebaseUser.email;
      });
    }

    setState(() {
      (currentUser == '')
          ? currentUser = firebaseUser.email
          : currentUser = firebaseUser.email;
    });

    return firebaseUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: (currentUser == null) ? '/' : '/homepage',
//      home: Homepage(),
      routes: {
        // Menu with 3 options
        '/homepage': (context) => Homepage(), //
        //Login
//        '/': (context) => Homepage(),
        '/': (context) => LoginScreen(), //
        // BIF- BlitzInnovationFramework
        '/BIFHomeView': (context) => BIFHomeScreen(),
        '/BlitzInnovationFramework': (context) => BlitzInnovationFramework(),
        //Study The Problem
        '/Problemstudy': (context) => ProblemStudy(),
        '/addpainpoints': (context) => AddPainPoints(),
        //BIF Dashboard
//        '/bifdashboard': (context) => bifdashboard(),
        '/editingScreen': (context) => Editingscreen(),
        //Studying the User
        '/adduserpersona': (context) => AddUserPersona(),
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
        //Pre-Validation
        '/addevangelistsandearlyadopters': (context) =>
            AddEvangelistsAndEarlyAdopters(),
        '/adddistributionmedium': (context) => AddDistributionMedium(),
        //Solution Validation
        '/addquotes': (context) => AddQuotes(),
        '/reviewcustomerrequirements': (context) =>
            ReviewCustomerRequirements(),
        //Managing Growth
        '/handlingscale': (context) => handlingScale(),
        '/addparallelinnovations': (context) => AddParallelInnovations(),
        //Metrics
        '/addproductmetrics': (context) => AddProductMetrics(),
        '/addmetrics': (context) => AddMetrics(),

        '/conceptDashboard': (context) => ConceptDashBoard(),

        // BC- BlitzCanvas
        '/BCHomeView': (context) => BCScreen(),
        //Step1 Build the Foundation
        '/BCStep1CollectAspects': (context) =>
            BcStep1CollectionAspects(), //Mission and Vision statements
        '/BCStep1AddDetails': (context) => Step1AddFoundation(), //OrangeCards
        //Step2
        '/BCStep2UserProfile': (context) => BcStep2CollectUserProfile(),
        '/BCStep2CaptureUserStories': (context) =>
            BcStep2CapturingUserStories(),
        //Step3 Defining the solution
        '/BCStep3Goals': (context) => Step3GoalsTheSolution(),
        '/BCStep3FeatureProduct': (context) => BcProductFeature(),
        '/BCStep3WireFrameLink': (context) => BcAddWireframeLink(),
        //step4 Unique selling proposition
        '/BCStep4SellingProposition': (context) => UniqueSellingProposition(),
        '/BCStep4ConsumerTouchPoints': (context) => BcConsumerTouchPoints(),
        //Step5 The User's feedback
        '/BCStep5CustomersQuotes': (context) => BcStep5CustomerQuotes(),
        //Step6 The User's feedback
        '/BCStep6CompetingProduct': (context) => BcStep6CompetingProducts(),
        //Step7 The User's feedback
        '/BCStep7BusinessModelElements': (context) => BcBusinessElements(),
        '/BCStep7IntellectualAssets': (context) =>
            BcIntellectualPropertyAssets(),
        '/BCStep7ServiceOffering': (context) => BcAsaServiceOffering(),
        //Step8 Synergies
        '/BCStep8Synergies': (context) => BcAddSynergies(),
//       //Step9 Managing growth
        '/BCStep9Growth': (context) => BcStep9BusinessGrowth(),
        '/BCStep9CreatingEcosystems': (context) => BcCreatingEcosystems(),
        //Step9 Managing growth
        '/BCStep10MetricSection1': (context) => BcStep10MetricSection1(),
        '/BCStep10MetricSection2': (context) => BcMetricsSection2(),
        '/BCStep10AddMoreMetrics': (context) => BcAddMoreMetrics(),

        //dashboard
        '/BusinessModelDashboard': (context) => BusinessModelDashBoard(),

        //BIF Blitz Canvas
        '/BIFCanvasFramework': (context) => BIFCanvasFramework(),
        //Step 1
        '/BIFCanvas': (context) => BIFCanvasFoundationAspects(),
        '/BIFCanvasFoundationAspectAdd': (context) =>
            BifCanvasAddFoundationAspects(),
        //Step2
        '/BIFCanvasWireframe': (context) => BifHighFidelityWireframe(),
        //Step 3
        '/BifCanvasSolution': (context) => BifCanvasSolution(),
        '/BifCanvasTouchPoint': (context) => BifTouchPoints(),
        //step4
        '/BIFElements': (context) => BifBusinessModelElements(),
        '/BIFIntellectualAssets': (context) => BifIntellectualPropertyAssets(),
        '/BIFServiceOffering': (context) => BifAsaServiceOffering(),
        //Step5 Synergies
        '/BIFSynergies': (context) => BifAddSynergies(),
        //Step6 Synergies
        '/BIFStarMetric': (context) => BifNorthMetric(),
        '/BIFAddmetrics': (context) => BifAddMetrics(),

        //BUF Product and Business Dashboard
        '/BUFDashboard': (context) => BUFDashboard(),
      },
    );
  }
}
