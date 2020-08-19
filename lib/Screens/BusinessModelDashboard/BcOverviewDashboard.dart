import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';

class BcOverviewDashboard extends StatefulWidget with ConceptDashboardStates {
  @override
  _BcOverviewDashboardState createState() => _BcOverviewDashboardState();
}

class _BcOverviewDashboardState extends State<BcOverviewDashboard> {

//  void initState() {
//    super.initState();
//    getDocuments();
//  }
//
//
//  void getDocuments() async {
//    spinner = true;
//    final document = await _firestore.get();
//
//    if (document.exists) {
//      try {
//        setState(() {
//          missionText = document.data['mission'];
//          visionText = document.data['vision'];
//          fireMissionData = document.data['mission'];
//          fireVisionData = document.data['vision'];
//          ID = document.documentID;
//          missionTextController.text = missionText;
//          visionTextController.text = visionText;
//        });
//      } catch (e) {
//        print(e);
//      }
//    } else{
//      _firestore.collection(currentUser).document('Bc1_buildTheFoundation').setData(
//          {}
//      );
//    }
//
//    setState(() {
//      spinner = false;
//    });
//  }
//


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Business Model Dashboard',
                        style: topHeadingTextStyle,
                        //TextStyle(fontSize: 60),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: 800,
                        color: Colors.white,
                        child: Material(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.menu_book),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Our purpose and Who we are',
                                          style: cardTitleTextStyle,
                                          //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  'Our Mission: To empower people to become more productive with the help of IT enabled capabilities',
                                  style: cardBodyTextStyle,
                                  //TextStyle(fontSize: 18),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  'Our Vision: To achieve an average of 20% efficiency improvement per customer by 2022.           ',
                                  style: cardBodyTextStyle,
                                  //TextStyle(fontSize: 18),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, bottom: 20),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'VIEW WIREFRAME',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFE95420),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Why our product matters to the customer:',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: [
                        DashboardCards(
                          cardIcon: Icons.new_releases,
                          cardTitle: 'What is our Primary Value Proposition?',
                          cardNote:
                              'A simple Task management solution for personal and professional use, influenced by the Eisenhower method.',
                          cardButtonName: 'VIEW WIREFRAME',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.call_split,
                          cardTitle: 'How our solution stands out',
                          cardNote:
                              'Employment of the Eisenhower method to task management with an emphasis on the user experience',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle:
                              'Customer Quotes (on using the solution prototype)',
                          cardNote:
                              'When I need to remember a task, I type it in. When I am done, I strike it out. It is that simple.',
                          cardButtonName: 'VIEW MORE QUOTES',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.vpn_key,
                          cardTitle: 'We excel at:',
                          cardNote:
                              'Developing models for prediction based on relevant data',
                          cardButtonName: 'VIEW FOUNDATIONAL DETAILS',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.trending_up,
                          cardTitle:
                              'Other offerings planned',
                          cardNote:
                              'Calendar Sync - Syncs ToDo items with a calendar and allows for meeting scheduling and meeting notes',
                          cardButtonName: 'REVIEW MORE SUCH OFFERINGS',
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'How we plan to get the product to market as quickly as possible:',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.work_off,
                          cardTitle: 'How we reduce rework',
                          cardNote:
                              'We intend to use Google Apps suite for the purpose of Collaboration when working on joint tasks.',
                          cardButtonName: 'VIEW SERVICES AND FRAMEWORKS',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.flip_camera_android_rounded,
                          cardTitle:
                              'How we Synergize',
                          cardNote:
                          '"A key resource (developer/designer) working with tech support personnel to create a new feature called \'task clipper\', based on studying user feedback. "',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.face,
                          cardTitle: 'What we learnt about our target customer',
                          cardNote:
                              'Urban dwellers who are employed and aged between 18 and 34 years . Solution is aimed at Both Enterprise and Consumer market segment(s).',
                          cardButtonName: 'VIEW PERSONA',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.leak_add,
                          cardTitle: 'What we learnt from our competition',
                          cardNote:
                          'Our competitor Todoist, offers features such as backup tasks to the cloud, labeling of tasks, smart schedule of tasks',
                          cardButtonName: 'REVIEW OTHER COMPETITORS',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'How we make money and manage capital:',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.attach_money,
                          cardTitle: 'How we make money.',
                          cardNote:
                              'We plan to monetize this innovation via advertising. This strategy will be integrated into the early desings of the solution.',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.folder_special,
                          cardTitle: 'IP Properties',
                          cardNote:
                              'The code behind the application will be protected by means of Copyright',
                          cardButtonName: 'VIEW ALL IP PROPERTIES',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.rate_review,
                          cardTitle:
                              'How we handle Growth',
                          cardNote:
                              'I intend to use a cloud service provider such as AWS, Firebase or Azure.',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Metrics, which will help keep us on track:',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 20.0),
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.star,
                          cardTitle: 'North Star metric',
                          cardNote:
                              'Ratio of tasks registered to tasks completed',
                          cardButtonName: 'VIEW OTHER METRICS',
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
