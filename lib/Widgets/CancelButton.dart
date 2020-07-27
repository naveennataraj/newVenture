import 'package:flutter/cupertino.dart';

class CancelButtton extends StatelessWidget {
  final Function OnTap;

  const CancelButtton({@required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Text(
        'CANCEL',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
