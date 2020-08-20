import 'package:flutter/cupertino.dart';

class SubdivisionalDashBoardLayout extends StatelessWidget {
  const SubdivisionalDashBoardLayout({
    this.dashboardTitle,
    this.dashboardcards,
    this.headingStyle,
    this.sizedboxwidth,
    this.headingAlignment,
    this.sizedboxheight,
  });
  final String dashboardTitle;
  final List<Widget> dashboardcards;
  final TextStyle headingStyle;
  final double sizedboxwidth;
  final double sizedboxheight;
  final CrossAxisAlignment headingAlignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: sizedboxwidth,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: headingAlignment,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: sizedboxheight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      dashboardTitle,
                      style: headingStyle,
                      //TextStyle(fontSize: 60),
                      textAlign: TextAlign.center,
                    ),
                  ),
//                  SizedBox(
//                    height: 100,
//                  ),
//                  GridView.count(
//                    crossAxisCount: 2,
//                    shrinkWrap: true,
//                    children: dashboardcards,
//                  )

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Wrap(
                        children: dashboardcards,
                      ),
                    ),
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
