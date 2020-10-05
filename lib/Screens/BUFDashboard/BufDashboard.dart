import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iventure001/Screens/BUFDashboard/BufCollapsingNavigationDrawer.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';

class BUFDashboard extends StatelessWidget {
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
        body: BlocProvider<BufDashboardNavigationBloc>(
          create: (context) => BufDashboardNavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<BufDashboardNavigationBloc,
                  BufDashboardStates>(
                builder: (context, concepDashboardNavigationState) {
                  return concepDashboardNavigationState as Widget;
                },
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: BufCollapsingNavigationDrawer()),
            ],
          ),
        ),);
  }
}
