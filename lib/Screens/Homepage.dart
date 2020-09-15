import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/MenuFrameworksCard.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
// BreadCrumb
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';


class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      backgroundColor: Colors.white,
      body: MenuFrameworkCard(menuContents[0]),

    );
  }
}
