import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Screens/ConceptDashBoard/conceptDashboardNavigationBloc.dart';
import 'package:iventure001/Screens/ConceptDashBoard/customerDashboard.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';

class overViewDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _overViewDashBoardState createState() => _overViewDashBoardState();
}

class _overViewDashBoardState extends State<overViewDashBoard> {
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
                        'Concept DashBoard',
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
                                      Icon(Icons.card_giftcard),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Tasks using E-Method (Primary Solution Offering)',
                                          style: cardTitleTextStyle,
                                          //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 30,
                                  ),
                                ),
                                Text(
                                  'A simple Task management solution for personal and professional use, influenced by the Eisenhower method.',
                                  style: cardBodyTextStyle,
                                  //TextStyle(fontSize: 18),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 30,
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
                  customerDashBoard(
                    sizedboxheight: 0,
                    sizedboxwidth: 0,
                    headingStyle: sideHeadingTextStyle,
                    headingAlignment: CrossAxisAlignment.start,
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
                      'Our Solution',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle: 'What we learnt from our competition',
                          cardNote:
                              'Our competitor Todoist, offers features such as backup tasks to the cloud, labeling of tasks, smart schedule of tasks.',
                          cardButtonName: 'REVIEW OTHER COMPETITORS',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle:
                              'List of planned features (for the solution)',
                          cardNote:
                              'For the initial release, we plan to include the following features: Export tasks to csv , Filter based on priority',
                          cardButtonName: 'VIEW ALL FEATURES',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.attach_money,
                          cardTitle: 'How we make money',
                          cardNote:
                              'We plan to monetize this innovation via advertising. This strategy will be integrated into the early desings of the solution.',
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
                      'When the customers interacted with our solution',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle: 'The customer problem is resolved.',
                          cardNote:
                              'When task management and personal planning is done through a streamlined system and task completion rate per month improves by 20%.',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle: 'How we intend to deliver the solution',
                          cardNote:
                              'We plan to distribute our product via: The web, as our primary medium.',
                          cardButtonName: 'CHANGE DISTRIBUTION MEDIUM',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.attach_money,
                          cardTitle:
                              'Customer Quotes (on using the solution prototype)',
                          cardNote:
                              '"When I need to remember a task, I type it in. When I am done, I strike it out. It is that simple."',
                          cardButtonName: 'VIEW MORE QUOTES',
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
                      'Planning the next steps...',
                      style: sideHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle: 'Problem-Solution fit review',
                          cardNote:
                              'The Customer problem always keeps evolving. We need to check back for relevance of problem-solution fit. The date for the next review is : 2nd Jun 2020',
                          cardButtonName: 'RESCHEDULE',
                          onTap: () {},
                        ),
                        DashboardCards(
                          cardIcon: Icons.person,
                          cardTitle: 'Parallel Products',
                          cardNote:
                              'At present, we can think of this additional product concept which can one of the we can think of these parallel innovations which can be of value to our customer base: \n Calendar Sync - Syncs ToDo items with a calendar and allows for meeting scheduling and meeting notes',
                          cardButtonName: 'REVIEW MORE SUCH SOLUTIONS',
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
