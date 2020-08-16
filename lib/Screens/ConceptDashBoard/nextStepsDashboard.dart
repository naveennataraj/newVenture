import 'package:flutter/cupertino.dart';

import 'conceptDashboardNavigationBloc.dart';

class nextStepsDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _nextStepsDashBoardState createState() => _nextStepsDashBoardState();
}

class _nextStepsDashBoardState extends State<nextStepsDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Next Steps Dashboard'),
    ));
  }
}
