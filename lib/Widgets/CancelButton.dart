import 'package:flutter/cupertino.dart';

class CancelButtton extends StatelessWidget {
  const CancelButtton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        'CANCEL',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
