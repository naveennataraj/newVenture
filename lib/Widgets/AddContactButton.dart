import 'package:flutter/cupertino.dart';

class AddContactButton extends StatelessWidget {
  AddContactButton({@required this.onTap});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD CONTACT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
