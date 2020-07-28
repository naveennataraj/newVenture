import 'package:flutter/cupertino.dart';

class goNextButton extends StatefulWidget {
  goNextButton({this.OnTap});

  final Function OnTap;

  @override
  _goNextButtonState createState() => _goNextButtonState();
}

class _goNextButtonState extends State<goNextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.OnTap,
      child: Text(
        'GO NEXT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
