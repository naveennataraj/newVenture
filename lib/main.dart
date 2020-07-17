import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework.dart';
import 'package:iventure001/Screens/EditingScreen.dart';
import 'package:iventure001/Screens/addpainpoints.dart';
import 'package:iventure001/bifdashboard.dart';

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
        '/': (context) => Homepage(),
        '/BlitzInnovationFramework': (context) => BlitzInnovationFramework(),
        '/Problemstudy': (context) => ProblemStudy(),
        '/bifdashboard': (context) => bifdashboard(),
        '/editingScreen': (context) => Editingscreen(),
        '/addpainpoints': (context) => AddPainPoints(),
      },
    );
  }
}
