import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/AsAServiceDialogue.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step2_StudyingTheUser/ContentUserStories.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step6_StudyingTheCompetition/ContentCompetingProduct.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/MarketDashboard/SynergyDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/MarketDashboard/TargetDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/MarketDashboard/CompetitorDialogue.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step6_StudyingTheCompetition/BcCompetingProducts.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/MarketDashboard/ReworkDialogue.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';

class BUFMarketDashboard extends StatefulWidget with BufDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BUFMarketDashboard(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});

  @override
  _BUFMarketDashboardState createState() => _BUFMarketDashboardState();
}

class _BUFMarketDashboardState extends State<BUFMarketDashboard> {
  final _firestore = Firestore.instance;
  //======= As a service Offering =======
  String asAService= '';
  String asAServiceDescription= '';
  //======= How we synergize  =======
  String stringSynergy= '';
  String synergy1;
  List valuePropositionList = [];
  List customerSegmentList = [];
  List revenueStreamList = [];
  List distributionChannel = [];
  List customerRelationshipList = [];
  List keyActivityList = [];
  List keyResourceList = [];
  List keyPartnerList = [];
  List costStructureList = [];
  String allSynergies;
  String sProposition;
  String sSegment;
  String sStream;
  String sDistributionChannel;
  String sCustomerRelationship;
  String sKeyActivity;
  String sKeyResource;
  String sKeyPartner;
  String sCostStructure;
  //======= User Stories =======
  String userStory= '';
  //======= From our competition =======
  String competitionName = '';
  String competitionDescription = '';

  UserStory(int index) {
    String A = userStoriesContent[index].Asa;
    String B = userStoriesContent[index].IWantTo;
    String C = userStoriesContent[index].SoThat;

    return 'As a $A, I want to $B so that $C';
  }


  void getDocuments() async {

    //======= As a service Offering =======
    final documentAddService = await _firestore
        .collection('$currentUser/Bc7_businessModelElements/addServices')
        .getDocuments();
    if (documentAddService != null) {

      addingAsaService = [];
      for (var message in documentAddService.documents) {
        final serviceName = message.data['serviceName'];
        final serviceDescription =
        message.data['serviceDescription'];
        final serviceType = message.data['serviceType'];
        final parentCompany = message.data['parentCompany'];
        final serviceTaskDescription = message.data['serviceTaskDescription'];
        final servicePercentage = message.data['servicePercentage'];

        final ID = message.documentID;

        final card = AddAsaServiceOffering(
          serviceName: serviceName,
          serviceDescription: serviceDescription,
          serviceType: serviceType,
          parentCompany: parentCompany,
          serviceTaskDescription: serviceTaskDescription,
          servicePercentage: servicePercentage,
          ID: ID,
        );
        addingAsaService.add(card);
      }
      setState(() {

        if(addingAsaService.length !=0) {
          asAService= addingAsaService[0].serviceName;
          asAServiceDescription= addingAsaService[0].serviceTaskDescription;
        } else {asAService= 'Missing value';}
      });
    }

    //======= How we synergize  =======

    final documentProposition = await _firestore
        .collection('$currentUser/Bc7_businessModelElements/addElements')
        .getDocuments();
    if (documentProposition != null) {
      valuePropositionList = [];
      customerSegmentList = [];
      revenueStreamList=[];
      distributionChannel=[];
      customerRelationshipList=[];
      keyActivityList=[];
      keyResourceList=[];
      keyPartnerList=[];
      costStructureList=[];

      for (var message in documentProposition.documents) {
        final elementTitle = message.data['elementTitle'];
        final elementDescription = message.data['elementDescription'];
        final elementChecked = message.data['elementChecked'];
        final ID = message.documentID;

        if (elementTitle == 'Value proposition') {
          valuePropositionList.add(elementDescription);
        }
        if (elementTitle == 'Customer segment') {
          customerSegmentList.add(elementDescription);
        }
        if (elementTitle == 'Revenue stream') {
          revenueStreamList.add(elementDescription);
        }

        if (elementTitle == 'Distribution channel') {
          distributionChannel.add(elementDescription);
        }
        if (elementTitle == 'Customer relationship') {
          customerRelationshipList.add(elementDescription);
        }
        if (elementTitle == 'Key activity') {
          keyActivityList.add(elementDescription);
        }
        if (elementTitle == 'Key resource') {
          keyResourceList.add(elementDescription);
        }
        if (elementTitle == 'Key partner') {
          keyPartnerList.add(elementDescription);
        }
        if (elementTitle == 'Cost Structure') {
          costStructureList.add(elementDescription);
        }
      }
    }


    final documentSynergies = await _firestore
        .collection('$currentUser/Bc8_synergies/addSynergies')
        .getDocuments();
    if (documentSynergies != null) {
      addingNewSynergies = [];
      for (var message in documentSynergies.documents) {
        final synergyName = message.data['synergyName'];
        final checkedValueProposition = message.data['checkedValueProposition'];
        final checkedCustomerSegment = message.data['checkedCustomerSegment'];
        final checkedRevenueStream = message.data['checkedRevenueStream'];
        final checkedDistributionChannel = message.data['checkedDistributionChannel'];
        final checkedCustomerRelationship = message.data['checkedCustomerRelationship'];
        final checkedKeyActivity = message.data['checkedKeyActivity'];
        final checkedKeyResource = message.data['checkedKeyResource'];
        final checkedKeyPartner = message.data['checkedKeyPartner'];
        final checkedCostStructure = message.data['checkedCostStructure'];
        final synergyDescription =
        message.data['synergyDescription'];
        final synergyValues = message.data['synergyValues'];
        final ID = message.documentID;

        final card = ContentSynergies(
          synergyName: synergyName,
          synergyValueProposition: checkedValueProposition,
          synergyCustomerSegment: checkedCustomerSegment,
          synergyRevenueStream: checkedRevenueStream,
          synergyDistributionChannel: checkedDistributionChannel,
          synergyCustomerRelationship: checkedCustomerRelationship,
          synergyKeyActivity: checkedKeyActivity,
          synergyKeyResource:checkedKeyResource,
          synergyKeyPartner: checkedKeyPartner,
          synergyCostStructure: checkedCostStructure,
          synergyDescription: synergyDescription,
          synergyValues: synergyValues,
          ID: ID,
        );
        addingNewSynergies.add(card);
      }
      //&& valuePropositionList.isNotEmpty
      if(addingNewSynergies[0].synergyValueProposition == true && valuePropositionList.isNotEmpty ) {
        sProposition = 'Value proposition (' + valuePropositionList.join(', ') + '), ';
      } else {sProposition = '';}
      //&& customerSegmentList.isNotEmpty
      if(addingNewSynergies[0].synergyCustomerSegment == true && customerSegmentList.isNotEmpty ) {
        sSegment = 'Customer segment (' + customerSegmentList.join(', ') + '), ';
      }else {sSegment = '';}
      //&& revenueStreamList.isNotEmpty
      if(addingNewSynergies[0].synergyRevenueStream == true && revenueStreamList.isNotEmpty ) {
        sStream = 'Revenue stream (' + revenueStreamList.join(', ') + '), ';
      }else {sStream = '';}
      //&& distributionChannel.isNotEmpty
      if(addingNewSynergies[0].synergyDistributionChannel == true && distributionChannel.isNotEmpty) {
        sDistributionChannel = 'Distribution channel (' + distributionChannel.join(', ') + '), ';
      }else {sDistributionChannel = '';}
      //&& customerRelationshipList.isNotEmpty
      if(addingNewSynergies[0].synergyCustomerRelationship == true && customerRelationshipList.isNotEmpty ) {
        sCustomerRelationship = 'Customer relationship (' +customerRelationshipList.join(', ') + '), ';
      }else {sCustomerRelationship = '';}
      //&& keyActivityList.isNotEmpty
      if(addingNewSynergies[0].synergyKeyActivity == true && keyActivityList.isNotEmpty) {
        sKeyActivity = 'Key activity (' + keyActivityList.join(', ') + '), ';
      }else {sKeyActivity = '';}
      //&& keyResourceList.isNotEmpty
      if(addingNewSynergies[0].synergyKeyResource == true && keyResourceList.isNotEmpty) {
        sKeyResource = 'Key resource (' + keyResourceList.join(', ') + '), ';
      }else {sKeyResource = '';}
      //&& keyPartnerList.isNotEmpty
      if(addingNewSynergies[0].synergyKeyPartner == true && keyPartnerList.isNotEmpty) {
        sKeyPartner = 'Key partner (' + keyPartnerList.join(', ') + '), ';
      }else {sKeyPartner = '';}
      //&& costStructureList.isNotEmpty
      if(addingNewSynergies[0].synergyCostStructure == true && costStructureList.isNotEmpty) {
        sCostStructure = 'Cost Structure (' + costStructureList.join(', ') + '), ';
      }else {sCostStructure = '';}
      allSynergies= sProposition + sSegment + sStream + sDistributionChannel + sCustomerRelationship + sKeyActivity + sKeyResource + sKeyPartner + sCostStructure;
    }
    setState(() {

      if(addingNewSynergies.length !=0) {
        stringSynergy= addingNewSynergies[0].synergyDescription;
        //allSynergies= sProposition + sSegment + sStream + sDistributionChannel + sCustomerRelationship + sKeyActivity + sKeyResource + sKeyPartner + sCostStructure;
       
      } else {asAService= 'Missing value';}
    });

  }
  // Refresh
  @override
  void initState() {
    if (currentUser != null) {
      getDocuments();
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocuments();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      sizedboxwidth:
      (widget.sizedboxwidth != null) ? widget.sizedboxwidth : 100,
      headingAlignment: (widget.headingAlignment != null)
          ? widget.headingAlignment
          : CrossAxisAlignment.center,
      headingStyle: (widget.headingStyle != null)
          ? widget.headingStyle
          : topHeadingTextStyle,
      sizedboxheight:
      (widget.sizedboxheight != null) ? widget.sizedboxheight : 50,
      dashboardTitle: 'How we plan to get the product to market as quickly as possible:',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.work,
            cardTitle: 'How to reduce rework by:',
            cardNote:
            '$asAService for the purpose of $asAServiceDescription',
            cardButtonName: 'VIEW SERVICES AND FRAMEWORKS',
            onTap: () {
              Navigator.pushNamed(context, '/BCStep7ServiceOffering');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ReduceReworkDialogue(
                    fromBufDashboard: true,
                    asAService: asAService,
                    descriptionService: asAServiceDescription
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: Hero(
            tag: 'synergyHero',
            child: DashboardCards(
              cardIcon: Icons.sync,
              cardTitle: 'How we Synergize',
              cardNote:
              '$allSynergies create a new feature called \'$stringSynergy\', based on studying user feedback.',
              cardButtonName: 'VIEW BUSINESS ELEMENTS',
              onTap: () {
                Navigator.pushNamed(context, '/BCStep7BusinessModelElements');
              },
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SynergyDialogue(
                    fromBufDashboard: true,
                    synergy: stringSynergy,
                    descriptionService: allSynergies,
                  ),
                ).then((_) => setState(() {}));
              },
            ),
          ),
        ),
      ],
    );
  }
}
