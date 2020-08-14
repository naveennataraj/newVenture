import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';

class ConceptDashBoard extends StatefulWidget {
  Widget dashboard;

  ConceptDashBoard({this.dashboard});
  @override
  _ConceptDashBoardState createState() => _ConceptDashBoardState();
}

class _ConceptDashBoardState extends State<ConceptDashBoard> {
  @override
  void initState() {
    if (widget.dashboard == null) {
      setState(() {
        widget.dashboard = Customer();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color(0xEEE95420),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SideButton(
                      buttonName: 'Overview',
                      dashboard: Overview(),
                      onpressed: () {
                        setState(() {
                          ConceptDashBoard(
                            dashboard: widget.dashboard,
                          );
                        });
                      },
                    ),
                    SideButton(
                      buttonName: 'Customer',
                      dashboard: Customer(),
                      onpressed: () {
                        setState(() {
                          ConceptDashBoard(
                            dashboard: Customer(),
                          );
                        });
                      },
                    ),
                    SideButton(
                      buttonName: 'Solution',
                    ),
                    SideButton(
                      buttonName: 'Feedback',
                    ),
                    SideButton(
                      buttonName: 'Next Steps',
                    ),
                  ],
                ),
              )
            ],
          ),
          Customer()
        ],
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
//              color: Colors.black,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title:
                            'Tasks using E-Method (Primary Solution Offering)',
                        description:
                            'A simple Task management solution for personal and professional use, influenced by the Eisenhower method.',
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title: 'Customer Pain Point (Primary)',
                        description:
                            'The customer tends to have too many tasks to manage. There is no system in place to help them manage their tasks efficiently, at the moment.',
                      ),
                      card(
                        title: 'List of planned features (for the solution)',
                        description:
                            'For the initial release, we plan to include the following features: Export tasks to csv , Filter based on priority',
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title: 'The customer problem is resolved..',
                        description:
                            'When task management and personal planning is done through a streamlined system and task completion rate per month improves by 20%',
                      ),
                      card(
                        title: 'Problem-Solution fit review',
                        description:
                            'The Customer problem always keeps evolving. We need to check back for relevance of problem-solution fit. The date for the next review is : 2nd Jun 2020',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideButton extends StatefulWidget {
  const SideButton({this.buttonName, this.dashboard, this.onpressed});

  final String buttonName;
  final Widget dashboard;
  final Function onpressed;

  @override
  _SideButtonState createState() => _SideButtonState();
}

class _SideButtonState extends State<SideButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: const Color(0xFFE95420),
        onPressed: widget.onpressed,
        child: Row(
          children: [
            Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.buttonName,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class card extends StatefulWidget {
  final String title;

  card({this.title, this.description});

  final String description;

  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 46.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0)),
          ],
        ),
        child: RaisedButton(
          hoverElevation: 20,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Customer extends StatelessWidget {
  const Customer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
//              color: Colors.black,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title: 'Who are our customers?',
                        description:
                            'Urban dwellers who are employed and aged between 18 and 34 years . Solution is aimed at Both Enterprise and Consumer market segment(s).',
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title: 'Customer Pain Point (Primary)',
                        description:
                            'The customer tends to have too many tasks to manage. There is no system in place to help them manage their tasks efficiently, at the moment.',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card(
                        title: 'Needs of our user(s)',
                        description:
                            '"As a casual user, I want to add a task in the least amount of steps possible so that I can collect all tasks to be managed in a single location"',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
