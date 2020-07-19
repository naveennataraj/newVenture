import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework.dart';
import 'package:iventure001/Screens/EditingScreen.dart';
import 'package:iventure001/Screens/addpainpoints.dart';
import 'package:iventure001/bifdashboard.dart';
import 'package:iventure001/Screens/BIFHomeScreen.dart';
import 'package:iventure001/Screens/BlitzCanvas/menuScreen.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1AddFoundation.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1CollectDetailsBusiness.dart';
import 'Homepage.dart';
import 'Screens/ProblemStudy.dart';

void main() {
  runApp(Vueapp());
}

class Vueapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
//      home: Homepage(),
      routes: {
        // Menu with 3 options
        '/': (context) => Homepage(),

        // BIF- BlitzInnovationFramework
        '/BIFHomeView': (context) => BIFHomeScreen(),
        '/BlitzInnovationFramework': (context) => BlitzInnovationFramework(),
        '/Problemstudy': (context) => ProblemStudy(),
        '/bifdashboard': (context) => bifdashboard(),
        '/editingScreen': (context) => Editingscreen(),
        '/addpainpoints': (context) => AddPainPoints(),

        // BC- BlitzCanvas
        '/BCHomeView': (context) => BCScreen(),
        //Step1
        '/BCStep1CollectAspects': (context) => BcStep1CollectionAspects(), //Mission and Vision statements
        '/BCStep1AddDetails': (context) => Step1AddFoundation(), //OrangeCards
      },
    );
  }
}
