import 'package:flutter/cupertino.dart';

import 'conceptDashboardNavigationBloc.dart';

class feedbackDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _feedbackDashBoardState createState() => _feedbackDashBoardState();
}

class _feedbackDashBoardState extends State<feedbackDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Feedback Dashboard'),
    ));
  }
}
