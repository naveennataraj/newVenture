import 'package:flutter/material.dart';
import 'package:iventure001/BlitzInnovationFramework.dart';
import 'package:iventure001/EditingScreen.dart';
import 'package:iventure001/bifdashboard.dart';

import 'Homepage.dart';
import 'ProblemStudy.dart';

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
      },
    );
  }
}
