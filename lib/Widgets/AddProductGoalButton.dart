import 'package:flutter/cupertino.dart';

class AddProductGoalButton extends StatelessWidget {
  AddProductGoalButton({@required this.routeName, @required this.onTap});
  final String routeName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD PRODUCT GOAL',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
