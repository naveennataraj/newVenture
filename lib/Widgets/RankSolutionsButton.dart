import 'package:flutter/cupertino.dart';

class RankSolutionsButton extends StatelessWidget {
  RankSolutionsButton({this.OnTap});
  final Function OnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Text(
        'RANK SOLUTIONS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
