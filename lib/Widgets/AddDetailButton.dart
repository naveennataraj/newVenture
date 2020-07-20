import 'package:flutter/cupertino.dart';

class AddDetailButton extends StatelessWidget {
  AddDetailButton({@required this.routeName, @required this.onTap});
  final String routeName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD DETAIL',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
