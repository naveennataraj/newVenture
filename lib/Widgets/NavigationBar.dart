import 'package:flutter/material.dart';

bool demoSelected = false;

class NavigationBar extends StatefulWidget {
  final String routeName;

  const NavigationBar({this.routeName});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('iVENTURE'),
            Spacer(),
            ToggleButtons(
              key: UniqueKey(),
              isSelected: [demoSelected],
              children: [Icon(Icons.desktop_mac)],
              onPressed: (int index) {
                setState(() {
                  demoSelected = !demoSelected;
                  Navigator.popAndPushNamed(context, widget.routeName);
                });
              },
              color: Colors.white,
              selectedColor: Colors.teal,
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE95420),
      ),
    );
  }
}
