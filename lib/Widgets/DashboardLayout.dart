import 'package:flutter/cupertino.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class SubdivisionalDashBoardLayout extends StatelessWidget {
  const SubdivisionalDashBoardLayout({
    this.dashboardTitle,
    this.dashboardcards,
  });
  final String dashboardTitle;
  final List<Widget> dashboardcards;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      dashboardTitle,
                      style: topHeadingTextStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
//                  GridView.count(
//                    crossAxisCount: 2,
//                    shrinkWrap: true,
//                    children: dashboardcards,
//                  )
                  Wrap(
                    children: dashboardcards,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
