import 'package:flutter/cupertino.dart';
import 'package:iventure001/Screens/ConceptDashBoard/conceptDashboardNavigationBloc.dart';

class overViewDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _overViewDashBoardState createState() => _overViewDashBoardState();
}

class _overViewDashBoardState extends State<overViewDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Overview Dashboard'),
    ));
  }
}
