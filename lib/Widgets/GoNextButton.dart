import 'package:flutter/cupertino.dart';

class goNextButton extends StatefulWidget {
  goNextButton({@required this.routeName, this.StepValidator});
  final String routeName;
  final Function StepValidator;

  @override
  _goNextButtonState createState() => _goNextButtonState();
}

class _goNextButtonState extends State<goNextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.StepValidator;
          Navigator.pushNamed(context, widget.routeName);
        });
      },
      child: Text(
        'GO NEXT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
