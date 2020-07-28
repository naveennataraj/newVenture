import 'package:flutter/cupertino.dart';

class AddMetricButton extends StatelessWidget {
  AddMetricButton({@required this.onTap});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD SOLUTION',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
