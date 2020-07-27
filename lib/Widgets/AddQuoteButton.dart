import 'package:flutter/cupertino.dart';

class AddQuoteButton extends StatelessWidget {
  AddQuoteButton({@required this.onTap});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD QUOTE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
