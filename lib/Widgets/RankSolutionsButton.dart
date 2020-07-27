import 'package:flutter/cupertino.dart';

class RankSolutionsButton extends StatelessWidget {
  RankSolutionsButton({@required this.routeName, this.StepValidator});
  final String routeName;
  final Function StepValidator;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        StepValidator;
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        'RANK SOLUTIONS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
