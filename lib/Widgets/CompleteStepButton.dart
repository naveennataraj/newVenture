import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CompleteStepButton extends StatefulWidget {
  const CompleteStepButton({this.OnTap, this.stepValidation});
  final Function OnTap;
  final bool stepValidation;

  @override
  _CompleteStepButtonState createState() => _CompleteStepButtonState();
}

class _CompleteStepButtonState extends State<CompleteStepButton> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.OnTap,

      child: Text(
        'COMPLETE STEP',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
