import 'package:flutter/cupertino.dart';

class AddDetailButton extends StatelessWidget {
  AddDetailButton({@required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        'ADD DETAIL',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
