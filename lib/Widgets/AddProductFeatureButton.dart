import 'package:flutter/cupertino.dart';

class AddProductFeatureButton extends StatelessWidget {
  AddProductFeatureButton({@required this.routeName, @required this.onTap});
  final String routeName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD PRODUCT FEATURE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}
