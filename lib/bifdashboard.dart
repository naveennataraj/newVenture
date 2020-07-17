import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/ProblemStudy.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';

class bifdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Concept Dashboard',
                  style: TextStyle(fontSize: 60),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/editingScreen');
                },
                child: Icon(Icons.edit),
              ),
              Hero(
                tag: 'hola',
                child: FrameworkCards(
                  frameworkdescrip: customerProblems,
                  buttonText: 'Explore Other Pain Points',
                  frameworkicon: Icons.people,
                  frameworkStep: 'Customer Pain Point',
                  navigateTo: null,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
