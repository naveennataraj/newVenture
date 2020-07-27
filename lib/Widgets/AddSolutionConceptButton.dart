import 'package:flutter/cupertino.dart';

class AddSolutionConceptButton extends StatelessWidget {
  AddSolutionConceptButton({@required this.onTap});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD SOLUTION CONCEPT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
