import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class confirmPreferenceButton extends StatefulWidget {
  confirmPreferenceButton({@required this.DialogueName});
  final Widget DialogueName;

  @override
  _confirmPreferenceButtonState createState() =>
      _confirmPreferenceButtonState();
}

class _confirmPreferenceButtonState extends State<confirmPreferenceButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => widget.DialogueName,
        ).then((_) => setState(() {}));
      },
      child: Text(
        'CONFIRM PREFERENCE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
