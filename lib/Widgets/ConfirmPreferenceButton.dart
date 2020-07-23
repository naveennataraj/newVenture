import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class confirmPreferenceButton extends StatelessWidget {
  confirmPreferenceButton({@required this.DialogueName});
  final Widget DialogueName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => DialogueName,
        );
      },
      child: Text(
        'CONFIRM PREFERENCE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
