import 'package:flutter/cupertino.dart';

class CompleteStepButton extends StatefulWidget {
  const CompleteStepButton({this.OnTap});
  final Function OnTap;

  @override
  _CompleteStepButtonState createState() => _CompleteStepButtonState();
}

class _CompleteStepButtonState extends State<CompleteStepButton> {
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
