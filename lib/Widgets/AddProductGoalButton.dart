import 'package:flutter/cupertino.dart';

class AddProductGoalButton extends StatelessWidget {
  AddProductGoalButton({@required this.onTap});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: (MediaQuery.of(context).size.width >= 750)
            ? Text(
                'ADD PRODUCT GOAL',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
              )
            : Text(
                'ADD\nPRODUCT\nGOAL',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
                textAlign: TextAlign.center,
              ));
  }
}
