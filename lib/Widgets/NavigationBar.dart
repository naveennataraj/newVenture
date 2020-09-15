import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool demoSelected = false;

class NavigationBar extends StatefulWidget {
  final String routeName;

  const NavigationBar({this.routeName});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

final _auth = FirebaseAuth.instance;

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('iVENTURE'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  _auth.signOut();
                  Navigator.popAndPushNamed(context, '/');
                },
                child: Icon(Icons.exit_to_app),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE95420),
      ),
    );
  }
}
