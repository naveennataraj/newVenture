import 'package:flutter/cupertino.dart';

class AddProductFeatureButton extends StatelessWidget {
  AddProductFeatureButton({@required this.routeName, @required this.onTap});
  final String routeName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: (MediaQuery.of(context).size.width >= 750)
            ? Text(
                'ADD PRODUCT FEATURE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
              )
            : Text(
                'ADD\nPRODUCT\nFEATURE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
                textAlign: TextAlign.center,
              ));
  }
}
