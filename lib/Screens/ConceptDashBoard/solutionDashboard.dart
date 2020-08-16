import 'package:flutter/cupertino.dart';

import 'conceptDashboardNavigationBloc.dart';

class solutionDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _solutionDashBoardState createState() => _solutionDashBoardState();
}

class _solutionDashBoardState extends State<solutionDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Solution Dashboard'),
    ));
  }
}
