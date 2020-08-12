import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('iVENTURE'),
          ],
        ),
        backgroundColor: const Color(0xFFE95420),
      ),
    );
  }
}
