import 'package:flutter/cupertino.dart';

class goNextButton extends StatelessWidget {
  goNextButton({@required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        'GO NEXT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
