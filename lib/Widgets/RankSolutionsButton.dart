import 'package:flutter/cupertino.dart';

class RankSolutionsButton extends StatelessWidget {
  RankSolutionsButton({@required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        'RANK SOLUTIONS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
