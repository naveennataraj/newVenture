import 'package:flutter/cupertino.dart';

import 'conceptDashboardNavigationBloc.dart';

class customerDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _customerDashBoardState createState() => _customerDashBoardState();
}

class _customerDashBoardState extends State<customerDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Customer Dashboard'),
    ));
  }
}
