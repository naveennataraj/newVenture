import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class BcMarketStrategy extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcMarketStrategy(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});

  @override
  _BcMarketStrategyState createState() => _BcMarketStrategyState();
}

class _BcMarketStrategyState extends State<BcMarketStrategy> {
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
          print(valuePropositionList);
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

        if(checkedValueProposition == true) {
           sProposition = 'Value proposition' + valuePropositionList.join(', ');
           print(sProposition);
        }
        if(checkedCustomerSegment == true) {
          sSegment = 'Customer segment' + customerSegmentList.join(', ');
        }
        if(checkedRevenueStream == true) {
          sStream = 'Revenue stream' + revenueStreamList.join(', ');
        }
        if(checkedDistributionChannel == true) {
          sDistributionChannel = 'Distribution channel' + distributionChannel.join(', ');
        }
        if(checkedCustomerRelationship == true) {
          sCustomerRelationship = 'Customer relationship' +customerRelationshipList.join(', ');
        }
        if(checkedKeyActivity == true) {
          sKeyActivity = 'Key activity' + keyActivityList.join(', ');
        }
        if(checkedKeyResource == true) {
          sKeyResource = 'Key resource' + keyResourceList.join(', ');
        }
        if(checkedKeyPartner == true) {
          sKeyPartner = 'Key partner' + keyPartnerList.join(', ');
        }
        if(checkedCostStructure == true) {
          sCostStructure = 'Cost Structure' + costStructureList.join(', ');
        }

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
    }
    setState(() {

      if(addingNewSynergies.length !=0) {
        stringSynergy= addingNewSynergies[0].synergyDescription;
        //allSynergies= sProposition + sSegment + sStream + sDistributionChannel + sCustomerRelationship + sKeyActivity + sKeyResource + sKeyPartner + sCostStructure;
      } else {asAService= 'Missing value';}
    });

    //======= User Stories =======
    final documentUserStories = await _firestore
        .collection('$currentUser/Bc2_studyingTheUser/addFoundations')
        .getDocuments();
    if (documentUserStories != null) {
      userStoriesContent = [];
      for (var message in documentUserStories.documents) {
        final Asa = message.data['Asa'];
        final IWantTo = message.data['IWantTo'];
        final SoThat = message.data['SoThat'];
        final ID = message.documentID;

        final card = BcContentUserStories(
          Asa: Asa,
          IWantTo: IWantTo,
          SoThat: SoThat,
          ID: ID,
        );
        userStoriesContent.add(card);
      }
      setState(() {
        if (userStoriesContent.length != 0) {
          userStory = UserStory(0);
        } else{
          userStory = 'Missing value';
        }
      });
    }

    //======= From our competition =======
//fromOurCompetition
    final documentFromOurCompetition = await _firestore
        .collection('$currentUser/Bc6_studyingTheCompetition/addPlayers')
        .getDocuments();
    if (documentFromOurCompetition != null) {
      AddingNewCompetingProduct = [];
      for (var message in documentFromOurCompetition.documents) {
        final ProductName = message.data['ProductName'];
        final OrgName = message.data['OrgName'];
        final Features = message.data['Features'];
        final CurrentOffering =
        message.data['CurrentOffering'];
        final ID = message.documentID;

        final card = BcCompetingProduct(
          ProductName: ProductName,
          OrgName: OrgName,
          Features: Features,
          CurrentOffering: CurrentOffering,
          ID: ID,
        );
        AddingNewCompetingProduct.add(card);
      }
      setState(() {
        if (AddingNewCompetingProduct.length != 0) {
          competitionName = AddingNewCompetingProduct[0].ProductName;
          competitionDescription = AddingNewCompetingProduct[0].CurrentOffering;
        } else{
          competitionName = 'Missing value';
          competitionDescription = 'Missing value';
        }
      });
    }
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
            cardIcon: Icons.person,
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
              cardIcon: Icons.person,
              cardTitle: 'How we Synergize',
              cardNote:
                  '"A with tech support personnel to create a new feature called \'$stringSynergy\', based on studying user feedback. "',
              onTap: () {},
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SynergyDialogue(
                    dashboardCard: stringSynergy,
                  ),
                ).then((_) => setState(() {}));
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.face,
            cardTitle: 'What we learnt about our target customer',
            cardNote:
                '$userStory',
            cardButtonName: 'VIEW PERSONA',
            onTap: () {
              Navigator.pushNamed(context, '/BCStep2CaptureUserStories');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomerTargetDialogue(
                  Asa: userStoriesContent[0].Asa,
                  IwantTo: userStoriesContent[0].IWantTo,
                  SothatIcan: userStoriesContent[0].SoThat,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.leak_add,
            cardTitle: 'What we learnt from our competition',
            cardNote:
                'Our competitor $competitionName, offers features such as $competitionDescription',
            cardButtonName: 'REVIEW OTHER COMPETITORS',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BcStep6CompetingProducts(fromDashboard: true,),
                  ));
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => CompetitorDialogue(
                  features: competitionDescription,
                  productName: competitionName,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
