import 'package:flutter/cupertino.dart';

class CompleteStepButton extends StatelessWidget {
  const CompleteStepButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.pushNamed(context, '/BlitzInnovationFramework');
      },
      child: Text(
        'COMPLETE STEP',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
