import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final AnimationController animationController;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  CollapsingListTile(
      {this.title,
      this.icon,
      this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  TextStyle listTileDefaultTextStyle =
      TextStyle(color: Colors.white70, fontSize: 20);
  TextStyle listTileSelectedTextStyle =
      TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 20);
  Animation<double> widthAnimation;
  Animation<double> sixedBoxAnimation;

  @override
  void initState() {
    widthAnimation =
        Tween<double>(begin: 90, end: 200).animate(widget.animationController);
    sixedBoxAnimation =
        Tween<double>(begin: 0, end: 10).animate(widget.animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.isSelected
                    ? Colors.white.withOpacity(0.9)
                    : Colors.white70,
                size: 40,
              ),
              SizedBox(
                width: sixedBoxAnimation.value,
              ),
              (widthAnimation.value >= 190)
                  ? Text(widget.title,
                      style: widget.isSelected
                          ? listTileSelectedTextStyle
                          : listTileDefaultTextStyle)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
