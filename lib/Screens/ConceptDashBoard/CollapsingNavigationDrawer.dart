import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iventure001/Data/ConceptDashBoard/NavigationModel.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CollapsingListTile.dart';
import 'package:iventure001/Screens/ConceptDashBoard/conceptDashboardNavigationBloc.dart';

class CollapsinNavigationDrawer extends StatefulWidget {
  @override
  _CollapsinNavigationDrawerState createState() =>
      _CollapsinNavigationDrawerState();
}

class _CollapsinNavigationDrawerState extends State<CollapsinNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 200;
  double minWidth = 90;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  int currentSelectedIndex = 0;

  TextStyle listTileDefaultTextStyle =
      TextStyle(color: Colors.white70, fontSize: 20);
  TextStyle listTileSelectedTextStyle =
      TextStyle(color: Colors.black, fontSize: 20);

  Color selectedColour = Color(0XFFFAFAFA);
  Color drawerBackgroungColour = Color(0xFFE95420);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      color: Colors.transparent,
      child: Container(
        width: widthAnimation.value,
        height: MediaQuery.of(context).size.height * 0.80,
        color: drawerBackgroungColour,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    height: 10,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                        BlocProvider.of<conceptDashboardNavigationBloc>(context)
                            .add(navigationItems[counter].event);
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.reverse()
                      : _animationController.forward();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
