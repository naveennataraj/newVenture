import 'package:flutter/cupertino.dart';

class AddIpAssetDetailButton extends StatelessWidget {
  AddIpAssetDetailButton({@required this.routeName, @required this.onTap});
  final String routeName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'ADD IP ASSET',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}