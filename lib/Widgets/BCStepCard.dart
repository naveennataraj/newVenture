import 'package:flutter/material.dart';

class BcStepCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.0),
      child: Material(
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: 250,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.collections_bookmark),
                Text('Step 1 - Build the Foundation'),
                Text('Defining the organization\'s mission, vision and other foudational elements.'),
            RaisedButton(
            elevation: 5,
            hoverElevation: 10,
            color: Color(0XFFE95420),
            onPressed: () {
              Navigator.pushNamed(context, '/AddCard');
            },
            child: Text(
              'LET\'s GET STARTED',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
