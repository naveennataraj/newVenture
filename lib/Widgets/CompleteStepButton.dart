import 'package:flutter/cupertino.dart';

class CompleteStepButton extends StatefulWidget {
  const CompleteStepButton({this.statusValidator});
  final Function statusValidator;

  @override
  _CompleteStepButtonState createState() => _CompleteStepButtonState();
}

class _CompleteStepButtonState extends State<CompleteStepButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.statusValidator;
          Navigator.pushNamed(context, '/BlitzInnovationFramework');
        });
      },
      child: Text(
        'COMPLETE STEP',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
