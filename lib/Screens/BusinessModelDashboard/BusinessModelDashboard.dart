import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcCollapsingNavigationDrawer.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';

class BusinessModelDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFFAFAFA),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Row(
              children: [
                Text('iVENTURE'),
              ],
            ),
            backgroundColor: const Color(0xFFE95420),
          ),
        ),
        body: BlocProvider<BcConceptDashboardNavigationBloc>(
          create: (context) => BcConceptDashboardNavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<BcConceptDashboardNavigationBloc,
                  ConceptDashboardStates>(
                builder: (context, concepDashboardNavigationState) {
                  return concepDashboardNavigationState as Widget;
                },
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: BcCollapsingNavigationDrawer()),
            ],
          ),
        ));
  }
}
