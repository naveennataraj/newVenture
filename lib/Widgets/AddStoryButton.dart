import 'package:flutter/cupertino.dart';

class AddStoryButton extends StatelessWidget {
  AddStoryButton({@required this.routeName, @required this.onTap, @required this.buttonName });
  final String routeName;
  final Function onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        buttonName,
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
